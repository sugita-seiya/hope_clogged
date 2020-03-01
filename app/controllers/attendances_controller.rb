class AttendancesController < ApplicationController
  require "date"
  def index
    @attendance_list = Attendance.all
  end

  def edit
    @today = Date.today.to_s
    @today_attendance = Attendance.find_by(days: @today)
  end

  def update
    # 時間のデータが存在する場合はdisabled
    # 出勤時間がなければ退勤を押せない
    # 過去日のものは変更できない
    @now = Time.new
    today_attendance = Attendance.find(params[:id])
    if params[:commit] == '出勤' then
      today_attendance.work_start = @now
      today_attendance.remarks = params[:attendance][:remarks]
      today_attendance.save
    elsif params[:commit] == '退勤' then
      today_attendance.work_end = @now
      today_attendance.remarks = params[:attendance][:remarks]
      today_attendance.save
    end
    redirect_to action: :edit
  end
end
