class AttendancesController < ApplicationController
  require "date"
  def index
    @attendance_list = Attendance.all
  end

  def edit
  end
end
