class GroupTransactionsController < ApplicationController
  before_action :authenticate_user!

  def new
    @current_group = Group.find_by(id: params[:id])
    @current_transaction = Transaction.new
  end

  def create
    group = Group.find_by(id: params[:group_id])
    return unless group

    group_transaction = Transaction.create(group_trans)
    group_transaction.is_group = true
    if group_transaction.save
      redirect_to groups_path, notice: 'Group Transactions created'
    else
      redirect_to new_group_path, alert: 'All fields are requred'
    end
  end

  def destroy
    trans = Transaction.find_by(id: params[:id])
    trans.destroy
    redirect_to transactions_path, alert: 'transaction deleted'
  end

  private

  def group_trans
    params.permit(:name, :amount, :user_id, :group_id)
  end
end
