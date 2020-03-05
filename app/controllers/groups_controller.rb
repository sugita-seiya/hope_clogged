class GroupsController < ApplicationController
  before_action :set_group

  def index
    @reports = Report.new
    @reports = @group.users.includes(:user)
  end


  def new
    @group = Group.new
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
