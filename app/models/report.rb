class Report < ApplicationRecord
  belongs_to :group
  belongs_to :user

  validates :date, :text, presence: true

  # 引数で渡されるsearchの中身に何もなければ全ての投稿を取得
  def self.search(search)
    return Report.all unless search
    Report.where('date LIKE(?)', "%#{search}%")
  end
end
