class GroupsController < ApplicationController
    before_action :authenticate_user!
  def index 
    @groups  = Group.all 
  end
  def new 
    @group = Group.new 
  end
  def show 
    @group = Group.find_by(id:params[:id])
  end
  def create 
    group = current_user.groups.build(group_params)
    if group.save 
      redirect_to groups_path, notice: 'group created'
      else 
        redirect_to new_group_path, alert: 'all fields are required'
    end
  end
  private
  def group_params 
    params.require(:group).permit(:name, :icon)
  end
end