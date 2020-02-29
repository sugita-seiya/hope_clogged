class CreateAttendances < ActiveRecord::Migration[5.2]
  def change
    create_table :attendances do |t|
      t.date :days
      t.timestamp :work_start
      t.timestamp :work_end
      t.text :remarks
      t.timestamps
    end
  end
end
