class TransactionsController < ApplicationController 
    def new
        @transaction = Transaction.new    
    end
    def create 
        transaction = current_user.transactions.build(trans_params)
        if transaction.save
            redirect_to root_path, notice: 'Transaction added'
        else
            redirect_to new_new_transaction, alert: 'All fields are required'
        end
    end

    private 
    def trans_params 
        params.require(:transaction).permit(:name, :amount, :type)
    end
end