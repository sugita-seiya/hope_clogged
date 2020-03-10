class TopController < ApplicationController
  before_action :set_group
  require "date"
  
  def index
    today = Date.today
    @year = today.year
    @month = today.month
    @day = today.day
    @attendance = Attendance.where(user_id: current_user.id,year: @year,month: @month,day: @day)
  end

  private
  def set_group
    if current_user.groups.ids.blank?
    else
      @group = Group.find(current_user.groups.ids)
      # @group = Group.find_by(params[:group_ids])
    end
  end
end
