class HomeController < ApplicationController 
    before_action :authenticate_user!
    def index
        @recent_transactions = Transaction.all
    end
end