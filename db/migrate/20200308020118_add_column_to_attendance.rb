class AddColumnToAttendance < ActiveRecord::Migration[5.2]
  def change
    add_column :attendances, :day, :integer, after: :days, null: false
    add_column :attendances, :month, :integer, after: :days, null: false
    add_column :attendances, :year, :integer, after: :days, null: false
  end
end
