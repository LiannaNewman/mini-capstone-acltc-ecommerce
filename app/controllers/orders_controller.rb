class OrdersController < ApplicationController
  def create
    order = Order.new(
    quantity: params[:quantity],
    user_id: current_user.id,
    product_id: params[:product_id]
    )
    order.save
    redirect_to "/orders/#{order.id}"
  end

  def show
    @order = Order.find_by(id: params[:id])
  end

end
