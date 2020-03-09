class ReportsController < ApplicationController
  before_action :set_group
  
  def top
    # @report = Report.new
  end

  # 過去履歴
  def index
    @reports = Report.new
    @reports = @groups.reports.includes(:user).order("created_at desc")
  end

  def new
    @report = Report.new
    # @group = Group.find_by(params[:group_ids])
  end

  def create
    @report = @group.reports.new(report_params)
    if @report.save
      redirect_to group_reports_path(@report), notice: 'メッセージが送信されました'
    else
      @reports = @group.reports.includes(:user)
      flash.now[:alert] = 'メッセージを入力してください。'
      render :new
    end
  end

  def show
    @report = Report.find_by(params[:id])
  end

  def edit
    @report = Report.find(params[:id])
  end

  def update
    report = Report.find(params[:id])
    report.update(report_params)
    redirect_to top_group_reports_path(report.id)
  end

  def destroy
    report = Report.find(params[:id])
    report.destroy
    redirect_to top_group_reports_path
  end

  private
  def report_params
    params.require(:report).permit(:date, :text).merge(user_id: current_user.id)
  end

  def set_group
    @group = Group.find(current_user.groups.ids.first)
    # @group = Group.find_by(params[:group_ids])
  end

end
