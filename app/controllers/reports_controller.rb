class ReportsController < ApplicationController
  before_action :set_group
  
  def top
    # @report = Report.new
  end

  # 過去履歴
  def index
    @reports = Report.new
    @reports = @group.reports.includes(:user)
  end

  def new
    @report = Report.new
  end

  def create
    @report = @group.reports.new(report_params)
    if @report.save
      redirect_to group_reports_path, notice: 'メッセージが送信されました'
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
    redirect_to reports_path(report.id)
  end

  def destroy
    report = Report.find(params[:id])
    report.destroy
    redirect_to reports_path
  end

  private
  def report_params
    params.require(:report).permit(:date, :text).merge(user_id: current_user.id)
  end

  def set_group
    @group = Group.find_by(params[:group_id])
  end

end
