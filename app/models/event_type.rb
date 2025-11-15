class EventType < ApplicationRecord
  # Associations
  belongs_to :user

  validates :name, presence: true
  validates :duration_minutes, presence: true, numericality: { only_integer: true }
  validates :active, presence: true
  validates :location_type, presence: true
end
