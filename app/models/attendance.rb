class Attendance < ApplicationRecord
  belongs_to :user, dependent: :destroy
end
