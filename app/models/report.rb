class Report < ApplicationRecord
  belongs_to :group
  belongs_to :user

  validates :date, :text, presence: true
end
