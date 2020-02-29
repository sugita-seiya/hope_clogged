class Report < ApplicationRecord
  validates :date, :text, presence: true
end
