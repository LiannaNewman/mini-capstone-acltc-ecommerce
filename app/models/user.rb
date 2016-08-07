class User < ApplicationRecord
  has_many :orders
  has_many :carted_products
  has_many :product, through: :carted_products

  has_secure_password
end
