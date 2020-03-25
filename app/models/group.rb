class Group < ApplicationRecord
  has_many :group_users, foreign_key: 'Group_id'
  # 「group.users」といった呼び出し方ができるようになる
  has_many :users, through: :group_users
  has_many :reports


  validates :name, presence: true, uniqueness: true
end
