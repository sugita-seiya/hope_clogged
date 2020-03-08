class AttendancesController < ApplicationController
  require "date"
  def index
    #当月のレコードを検索
    today = Date.today
    @attendance_list = Attendance.where(year:today.year,month:today.month)
  end

  def edit
    @today = Date.today
    # @today_attendance = Attendance.find_by(days: @today)
    @today_attendance = Attendance.find_by(year: @today.year,month:@today.month,day:@today.day)
    # 出勤・退勤時間が入力されていれば日本時間でformatを行う
    if !@today_attendance.work_start.nil? then
      @today_attendance_work_start = @today_attendance.work_start.in_time_zone('Tokyo').strftime("%H:%M")
    end
    if !@today_attendance.work_end.nil? then
      @today_attendance_work_end = @today_attendance.work_end.in_time_zone('Tokyo').strftime("%H:%M")
    end
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
