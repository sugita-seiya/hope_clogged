class AttendancesController < ApplicationController
  require "date"
  def index
    today = Date.today
    thisYear = today.year
    thisMonth = today.month
    thisMonthLastDay = today.end_of_month.mday
    
    (1..thisMonthLastDay).each do |day|
      strMonthly = today.year.to_s + "/" + today.month.to_s + "/" + day.to_s
      monthly = Date.parse(strMonthly)
      puts monthly
    end
  end
end
