class AddColumnUserIdToAttendances < ActiveRecord::Migration[5.2]
  def change
    add_reference :attendances, :user, foreign_key: true, after: :id
  end
end
