class EventType < ApplicationRecord
  # Associations
  belongs_to :user

  validates :name, presence: true, length: { maximum: 100 }
  validates :duration_minutes, presence: true, numericality: {
    only_integer: true,
    greater_tham: 0,
    less_than_or_equal_to: 400
  }
  validates :active, presence: true
  validates :location_type, presence: true, inclusion: {
    in: %w[zoom google_meet phone in_person custom],
    message: "%{value} no es un tipo de ubicación válido"
  },
  allow_blank: true
end
