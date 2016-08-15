class Product < ApplicationRecord
  belongs_to :order, optional: true
  has_many :carted_products
  has_many :categories, through: :category_products
  has_many :category_products
  validates :name, :price, :description, :image, presence: true
  validates :price, numericality: true
  validates :description, length: { maximum: 500 }

  def sale_message
    if price.to_i < 45
      return "Discount Item!"
    else
      return "Not on Sale!"
    end
  end

  def tax
    (price.to_i * 0.09).round(2)
  end

  def total
    price.to_i + (price.to_i * 0.09)
  end
end

# Bonus: add styling to your discounted items so the price shows up in red
