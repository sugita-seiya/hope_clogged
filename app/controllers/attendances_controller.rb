class AttendancesController < ApplicationController
  require "date"
  def index
    if params[:search] == "次月" then
      @year = params[:year]
      @month = (params[:month].to_i) + 1
      @attendance_list = Attendance.where(user_id: current_user.id,year:params[:year],month:@month)
      if params[:month] == "12" then
        @year = (params[:year].to_i) + 1
        @month = 1
        @attendance_list = Attendance.where(user_id: current_user.id,year:@year,month:@month)
      end
    elsif params[:search] == "前月" then
      @year = params[:year]
      @month = (params[:month].to_i) - 1
      @attendance_list = Attendance.where(user_id: current_user.id,year:params[:year],month:@month)
      if params[:month] == "1" then 
        @year = (params[:year].to_i) - 1
        @month = 12
        @attendance_list = Attendance.where(user_id: current_user.id,year:@year,month:@month)
      end
    else
      today = Date.today
      @year = today.year
      @month = today.month
      @attendance_list = Attendance.where(user_id: current_user.id,year:@year,month:@month)
    end
  end

  def edit
    @today = Date.today
    # @today_attendance = Attendance.find_by(days: @today)
    @today_attendance = Attendance.find_by(user_id: current_user.id, year: @today.year,month:@today.month,day:@today.day)
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
