class GroupUser < ApplicationRecord
  belongs_to :group, foreign_key: :group_id, optional: true
  belongs_to :user, optional: true
end
