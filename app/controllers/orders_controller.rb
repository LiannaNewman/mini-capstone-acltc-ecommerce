class OrdersController < ApplicationController
  def create
    order = Order.new(
    user_id: current_user.id,
    )
    order.order_subtotal
    order.order_tax
    order.order_total
    order.save
    cart = CartedProduct.where("user_id = ? AND status = ?", current_user.id, "Carted")
    cart.each do |item|
      if item.status == "Carted"
         item.status = "Purchased"
      end
      item.order_id = order.id
      item.save
    end
    redirect_to "/orders/#{order.id}"
  end

  def show
    @order = Order.find_by(id: params[:id])
  end

end
