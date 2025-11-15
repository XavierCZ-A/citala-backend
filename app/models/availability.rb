class Availability < ApplicationRecord
  # Associations
  belongs_to :user

  validates :day_of_week, presence: true, numericality: { only_integer: true, less_than_or_equal_to: 6  }
  validates :start_time, presence: true
  validates :end_time, presence: true, comparison: { greater_than: :start_time }
end
