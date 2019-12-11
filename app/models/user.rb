class User < ApplicationRecord
  has_many :bills, dependent: :destroy
  has_many :rates, dependent: :destroy
  has_many :news, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :name, presence: true, length: {maximum: Settings.name.maximum}
  validates :email, presence: true, length: {maximum: Settings.email.maximum},
    format: {with: Settings.email.valid_email_regex},
    uniqueness: true
  validates :password, presence: true, length: {minimum: Settings.password.minimum}, allow_nil: true
  has_secure_password

  USER_PARAMS = %i(name email password password_confirmation).freeze
end
