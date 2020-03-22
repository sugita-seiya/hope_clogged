class ReportsController < ApplicationController
  before_action :set_group
  
  def top
    today = Date.today
    @year = today.year
    @month = today.month
    @day = today.day
    @attendance = Attendance.where(user_id: current_user.id,year: @year,month: @month,day: @day)
  end

  # 過去履歴
  def index
    @reports = Report.new
    @reports = @group.reports.includes(:user).order("created_at desc")
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
    @report = Report.find(params[:id])
  end

  def edit
    @report = Report.find(params[:id])
  end

  def update
    report = Report.find(params[:id])
    report.update(report_params)
    redirect_to  group_reports_path(current_user.groups.ids)
  end

  def destroy
    report = Report.find(params[:id])
    report.destroy
    redirect_to group_reports_path(current_user.groups.ids)
  end

  def search
    @reports = Report.search(params[:keyword]).order("created_at desc")
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
