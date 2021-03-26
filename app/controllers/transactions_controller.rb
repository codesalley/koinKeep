class TransactionsController < ApplicationController
  before_action :authenticate_user!
  def new
    @transaction = Transaction.new
  end

  def index
    @transactions = current_user.transactions.most_recent
    @total = current_user.transactions.sum(:amount)
  end

  def create
    transaction = current_user.transactions.build(trans_params)
    if transaction.save
      redirect_to root_path, notice: 'Transaction added'
    else
      redirect_to new_new_transaction, alert: 'All fields are required'
    end
  end

  def destroy
    trans = Transaction.find_by(id: params[:id])
    trans.destroy
    redirect_to root_path, alert: 'Transaction deleted'
  end

  def external
    @external_transactions = current_user.transactions.external_transactions.most_recent
    @external_total = current_user.transactions.external_transactions.sum(:amount)
  end

  private

  def trans_params
    params.require(:transaction).permit(:name, :amount)
  end
end
