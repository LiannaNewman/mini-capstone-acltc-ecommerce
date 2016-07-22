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
    @products = Product.create(
    name: params[:name],
    price: params[:price],
    image: params[:image],
    description: params[:description]
    )
    @products.save
    render 'create.html.erb'
  end

  def new
    render 'new.html.erb'
  end

  def edit
    @products = Product.find_by(id: params[:id])
    render 'edit.html.erb'
  end

end
