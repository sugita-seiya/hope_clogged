class GroupUser < ApplicationRecord
  belongs_to :group, foreign_key: :group_id
  belongs_to :user
end
