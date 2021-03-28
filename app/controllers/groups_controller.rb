class GroupsController < ApplicationController
  before_action :authenticate_user!
  def index
    @groups = Group.order('name ASC')
  end

  def new
    @group = Group.new
  end

  def show
    @group = Group.find_by(id: params[:id])
    @current_group_transactions = @group.transactions.all
    @group_transactions_total =  @current_group_transactions.sum(:amount)
  end

  def create
    group = current_user.groups.build(group_params)

    if group.save
      redirect_to groups_path, notice: 'Group Created'
    else
      redirect_to new_group_path, alert: 'Error creating group, try again'
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
