class GroupsController < ApplicationController
  before_action :set_group

  def index
    @groups = Group.all
  end

  def new
    @group_users = GroupUser.new

    # 現在ログイン中のユーザーを、新規作成したグループに追加。
  end

  def create
    GroupUser.create(group_id:params[:group_id], user_id:params[:user_ids])
    # @group_users = GroupUser.new(group_params)
    # if @group_users.save!
    #   redirect_to root_path, notice: 'グループを作成しました'
    # else
    #   render :new
    # end
    redirect_to root_path, notice: 'グループを作成しました'
  end

  def edit
    @group = Group.find(params[:id])
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
    #  params.require(:group).permit(:name, user_ids: [] )
  end

  def set_group
    @group = Group.find_by(params[:id])
  end
end
