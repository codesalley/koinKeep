class TransactionsController < ApplicationController
  before_action :authenticate_user!
  def new
    @transaction = Transaction.new
    @groups_arr = Group.all.map { |g| [g.name, g.id] }
    @groups_arr << ['None', nil]
  end

  def index
    @transactions = current_user.transactions.includes(:user, :group).most_recent
    @total = current_user.transactions.sum(:amount)
  end

  def create
    transaction = current_user.transactions.build(trans_params)
    transaction.is_group = true unless transaction.group_id.nil?
    if transaction.save
      redirect_to root_path, notice: 'Transaction added'
    else
      redirect_to new_transaction_path, alert: 'Error adding transaction'
    end
  end

  def destroy
    trans = Transaction.find_by(id: params[:id])
    trans.destroy
    redirect_to root_path, alert: 'Transaction Deleted'
  end

  def external
    @external_transactions = current_user.external_transactions.includes(:user, :group).most_recent

    @external_total = current_user.external_transactions.sum(:amount)
  end

  private

  def trans_params
    params.require(:transaction).permit(:name, :amount, :group_id)
  end
end
