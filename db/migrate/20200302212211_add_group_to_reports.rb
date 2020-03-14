class AddGroupToReports < ActiveRecord::Migration[5.2]
  def change
    add_reference :reports, :group, foreign_key: true, dependent: :destroy
    add_reference :reports, :user, foreign_key: true, dependent: :destroy
  end
end
