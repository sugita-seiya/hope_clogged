class GroupsController < ApplicationController
  before_action :set_group

  def index
    @groups = Group.all
  end

  def new
    @group = Group.new
    # 現在ログイン中のユーザーを、新規作成したグループに追加。
    @group.users << current_user
  end

  def create
    @group = Group.new(group_params)
    if @group.save!
      redirect_to root_path, notice: 'グループを作成しました'
    else
      render :new
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    group = Group.find(params[:id])
    group.update(group_params)
    redirect_to top_group_reports_path(group.id)
  end

  def destroy
    group= Group.find(params[:id])
    group.destroy
    redirect_to groups_path(@group)
  end

  def show
    @group = Group.find(params[:id])
  end

  private
  def group_params
    params.require(:group).permit(:name, { :user_ids => [] })
    #  params.require(:group).permit(:name, user_ids: [] )
  end

  def set_group
    @group = Group.find_by(params[:ids])
  end
end
