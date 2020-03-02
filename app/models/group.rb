class Group < ApplicationRecord
  has_many :group_users
  # 「group.users」といった呼び出し方ができるようになる
  has_many :users, through: :group_users

  validates :name, presence: true, uniqueness: true
end
