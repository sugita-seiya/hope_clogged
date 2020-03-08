require "#{Rails.root}/app/models/attendance"
require "date"

class Tasks::Attendancetask
  def self.create
    today = Date.today
    thisYear = today.year
    thisMonth = today.month
    thisMonthLastDay = today.end_of_month.mday

    (1..thisMonthLastDay).each do |day|
      strMonthly = today.year.to_s + "/" + today.month.to_s + "/" + day.to_s
      monthly = Date.parse(strMonthly)
      Attendance.create(
         days: monthly,
         year: thisYear,
         month: thisMonth,
         day: day,
         remarks: ''
       )
    end
  end 
end