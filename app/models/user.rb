class User < ApplicationRecord
  # relationships to -- secrets -- likes
  has_many :secrets
  has_many :likes, dependent: :destroy
  has_many :secrets_liked, through: :likes, source: :secret

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :name, presence: true
  validates :email, presence: true, format: { with: EMAIL_REGEX }, uniqueness: {case_sensitive: false}

  has_secure_password
  validates_presence_of :password, on: :create
  validates_confirmation_of :password, :allow_blank => true
  # before_save { |user| user.email = user.email.downcase! }
end
