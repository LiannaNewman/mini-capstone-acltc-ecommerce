class Category < ApplicationRecord
  has_many :products
  has_many :category_products
  has_many :products, through: :category_products
end
