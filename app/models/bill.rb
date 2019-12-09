class Bill < ApplicationRecord
  belongs_to :user
  belongs_to :product

  has_many :bill_details, dependent: :destroy
end
