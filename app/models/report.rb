class Report < ApplicationRecord
  validates :date, :text, presence: true

  belongs_to  :group
end
