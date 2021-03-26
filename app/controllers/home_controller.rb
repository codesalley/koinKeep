class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    @recent_transactions = Transaction.most_recent
  end
end
