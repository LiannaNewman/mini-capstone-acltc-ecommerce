class CartedProductsController < ApplicationController

def index
  @cart = CartedProduct.where("user_id = ? AND status = ?", current_user.id, "Carted")
  if @cart.empty?
    redirect_to "/products"
  else
    render 'index.html.erb'
  end
end

def create
  cart = CartedProduct.new(
  quantity: params[:quantity],
  user_id: current_user.id,
  product_id: params[:product_id],
  status: "Carted"
  )
  cart.save
  redirect_to "/carted_products"
end

def update
  @cart = CartedProduct.find_by(id: params[:id])
  flash[:success] = "Your Order #{@order.id} is complete!"
  redirect_to "/orders/#{@order.id}"
end

def destroy
  @cart = CartedProduct.find_by(id: params[:id])
  @cart.destroy
  flash[:success] = "This has been removed succesfully from your cart!"
  redirect_to "/carted_products"
end

end
