require "#{Rails.root}/app/models/attendance"
require "date"

class Tasks::Attendancetask
  def self.create
    today = Date.today >> 1
    thisYear = today.year
    thisMonth = today.month
    thisMonthLastDay = today.end_of_month.mday
    user_list = User.all
    (1..user_list.length).each do |user|
      #今月の日にち分データを作成
      (1..thisMonthLastDay).each do |day|
        # strMonthly = today.year.to_s + "/" + today.month.to_s + "/" + day.to_s
        # monthly = Date.parse(strMonthly)
        Attendance.create(
          user_id: user, 
          # days: monthly,
          year: thisYear,
          month: thisMonth,
          day: day,
          remarks: ''
        )
      end
    end
  end 
end