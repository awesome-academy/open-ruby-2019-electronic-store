class User < ApplicationRecord
  attr_accessor :remember_token
  before_save :downcase_email
  
  has_many :bills, dependent: :destroy
  has_many :rates, dependent: :destroy
  has_many :news
  has_many :comments, dependent: :destroy

  validates :name, presence: true, length: {maximum: Settings.name.maximum}
  validates :email, presence: true, length: {maximum: Settings.email.maximum},
    format: {with: Settings.email.valid_email_regex},
    uniqueness: true
  validates :password, presence: true, length: {minimum: Settings.password.minimum}, allow_nil: true
  has_secure_password

  USER_PARAMS = %i(name email password password_confirmation).freeze

  class << self
    def digest string 
      if ActiveModel::SecurePassword.min_cost 
        cost = BCrypt::Engine::MIN_COST 
      else 
        cost = BCrypt::Engine.cost
      end
      BCrypt::Password.create string, cost: cost
    end

    def new_token
      SecureRandom.urlsafe_base64
    end
  end

  def remember
    remember_token = User.new_token
    update_attributes remember_digest: User.digest(remember_token)
  end

  def authenticated? remember_token
    BCrypt::Password.new(remember_digest).is_password? remember_token
  end

  def forget
    update_attributes remember_digest: nil
  end

  private

  def downcase_email
    email.downcase!
  end
end
