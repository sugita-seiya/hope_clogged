class GroupsController < ApplicationController
  before_action :set_group

  def index
    @groups = Group.all
  end

  def new
    @group_users = GroupUser.new
  end

  def create
    begin
      @group_users = GroupUser.create(group_id:params[:group_id], user_id:params[:user_ids])
      redirect_to root_path, notice: 'グループを作成しました'
    rescue
      render :new
    end
  end

  def edit
    @group_users = GroupUser.find_by(params[:id])
  end

  def update
    if @group.update(group_params)
      redirect_to top_group_reports_path(@group)
    else
      render :edit
    end
  end

  def destroy
    group= Group.find(params[:id])
    group.destroy
    redirect_to groups_path(@group)
  end

  def show
    @group = Group.find(params[:id])
    @group_users = GroupUser.all
  end

  private
  def group_params
    params.require(:group).permit(:name, { :user_ids => [] })
  end

  def set_group
    @group_users = GroupUser.find_by(params[:id])
  end
end
