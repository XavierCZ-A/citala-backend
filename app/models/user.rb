class User < ApplicationRecord
  has_secure_password

  # Associations
  has_many :event_types, dependent: :destroy
  has_many :availabilities, dependent: :destroy
  has_many :bookings, dependent: :destroy

  validates :email, presence: true, uniqueness: { case_sensetive: true }, format: {
    with: URI::MailTo::EMAIL_REGEXP
  }
  validates :first_name, :last_name, presence: true, format: {
    with: /\A[a-z0-9_-]+\z/i
  },
  length: { minimum: 3, maximum: 30 }

  validates :password, presence: true, length: { minimum: 6 }

  normalizes :email, with: ->(email) { email.strip.downcase }
  normalizes :email, with: ->(first_name) { first_name.strip.downcase }
  normalizes :email, with: ->(last_name) { last_name.strip.downcase }


  def full_name
    "#{first_name} #{last_name}".strip
  end
end
