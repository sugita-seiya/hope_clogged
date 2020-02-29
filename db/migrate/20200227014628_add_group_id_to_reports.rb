class AddGroupIdToReports < ActiveRecord::Migration[5.2]
  def change
    add_column :reports, :group_id, :integer
  end
end
