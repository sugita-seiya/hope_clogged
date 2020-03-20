class GroupUser < ApplicationRecord
  belongs_to :group, foreign_key: :group_id, dependent: :destroy
  belongs_to :user, dependent: :destroy
end
