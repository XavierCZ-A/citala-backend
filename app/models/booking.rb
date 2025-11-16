class Booking < ApplicationRecord
  # Associations
  belongs_to :user

  enum :status, { pending: 0, confirmed: 1, cancelled: 2, completed: 3 }

  validates :invite_name, presence: true, length: { maximum: 100 }
  validates :invite_email, presence: true, format: {
    with: URI::MailTo::EMAIL_REGEXP
  }, allow_blank: true
  validates :invite_phone, presence: true, format: {
    with: /\A\+\d{10,15}\z/
  }, allow_blank: true
  validates :start_time, presence: true
  validates :end_time, presence: true, comparison: { greater_than: :start_time }
  validates :booking_source, presence: true
end
