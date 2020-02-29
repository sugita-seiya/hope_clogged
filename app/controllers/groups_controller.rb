class GroupsController < ApplicationController
  
  def new
    @group = Group.new
  end

  def create
    @group = Group.create(group_params)
    redirect_to reports_path
  end

  private
  def group_params
    params.require(:group).permit(:name)
  end
end
