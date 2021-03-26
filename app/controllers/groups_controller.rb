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
  end

  def create
    group = current_user.groups.build(group_params)

    if group.save
      redirect_to groups_path, notice: 'group created'
    else
      redirect_to new_group_path, alert: 'All fields are required name must be unique'
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
