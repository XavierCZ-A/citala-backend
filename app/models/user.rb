class User < ApplicationRecord
  has_secure_password

  # Associations
  has_many :event_types, dependent: :destroy

  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :first_name, :last_name, presence: true
  validates :password, presence: true, length: { minimum: 6 }

  def full_name
    "#{first_name} #{last_name}".strip
  end
end
