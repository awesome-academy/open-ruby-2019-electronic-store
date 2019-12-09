class Product < ApplicationRecord
  belongs_to :brand
  belongs_to :category

  has_many :bills, dependent: :destroy
  has_many :sales, dependent: :destroy
  has_many :comments, as: :commentable
  has_many :advertises, dependent: :destroy
end
