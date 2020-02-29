# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "date"

today = Date.today
thisYear = today.year
thisMonth = today.month
thisMonthLastDay = today.end_of_month.mday

#今月の日にち分データを作成
(1..thisMonthLastDay).each do |day|
  strMonthly = today.year.to_s + "/" + today.month.to_s + "/" + day.to_s
  monthly = Date.parse(strMonthly)
  Attendance.create!(
     days: monthly,
     remarks: '腹痛のため遅刻'
   )
end

