class Order < ApplicationRecord
belongs_to :user, optional: true
has_many :carted_products
has_many :products, through: :carted_products

validates :user_id, presence: true
validates :user_id, uniqueness: true
validates :subtotal, presence: true, numericality: true
validates :tax, presence: true, numericality: true
validates :total, presence: true, numericality: true

def order_subtotal
  @cart = CartedProduct.where("user_id = ? AND status = ?", user_id, "Carted")
  o_subtotal = 0
  @cart.each do |item|
    o_subtotal += item.quantity * (item.product.price)
  end
  self.subtotal = o_subtotal
end

def order_tax
  @cart = CartedProduct.where("user_id = ? AND status = ?", user_id, "Carted")
  o_tax = 0
  @cart.each do |item|
    o_tax += item.quantity * (item.product.price * 0.09)
  end
  self.tax = o_tax
end

def order_total
  self.total = order_subtotal + order_tax
end

end
