class ProductsController < ApplicationController
  def index
    @products = Product.all
    render 'index.html.erb'
  end

  def show
    @products = Product.find_by(id: params[:id])
    render 'show.html.erb'
  end

  def create
    Product.create(
    name: params[:name],
    price: params[:price],
    image: params[:image],
    description: params[:description]
    )
    render 'index.html.erb'
  end

  def new
    render 'new.html.erb'
  end
end
