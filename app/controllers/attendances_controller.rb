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
    @now = Time.new
    today_attendance = Attendance.find(params[:id])
    if params[:commit] == '出勤' then
      today_attendance.work_start = @now
    elsif params[:commit] == '退勤' then
      today_attendance.work_end = @now
    end
    today_attendance.remarks = params[:attendance][:remarks]
    today_attendance.save
    redirect_to action: :edit
  end
end
