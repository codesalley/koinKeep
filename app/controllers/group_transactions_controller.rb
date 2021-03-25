class GroupTransactionsController < ApplicationController 
    before_action :authenticate_user!

    def new 
        @current_group = Group.find_by(id: params[:id])
        @current_transaction = Transaction.new 
    end
    def create 
        group = Group.find_by(id: params[:group_id])
        if group
            group_trans = group.transactions.build(name: params[:transaction][:name], amount: params[:transaction][:amount] , user_id: params[:user_id])
            group_trans.is_group = true 
            if group_trans.save
                redirect_to groups_path, notice: 'Group Transactions created'
            else 
                redirect_to new_groups_path, alert: 'All fields are requred'
            end
        end
    end
end