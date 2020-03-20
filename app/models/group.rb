class Group < ApplicationRecord
  has_many :group_users, dependent: :destroy
  # 「group.users」といった呼び出し方ができるようになる
  has_many :users, through: :group_users, dependent: :destroy
  has_many :reports, dependent: :destroy


  validates :name, presence: true, uniqueness: true
end
