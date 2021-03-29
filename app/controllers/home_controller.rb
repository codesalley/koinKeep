class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    @recent_transactions = Transaction.includes(:user, :group).most_recent
  end
end
