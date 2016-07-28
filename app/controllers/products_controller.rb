class ProductsController < ApplicationController
  def index
    if params["blah"]
      @products = Product.order(params["sort"])
    elsif params["blah_blah"] == "whatever"
      @products = Product.order(price: :desc)
    elsif params[:ha_ha_ha]
      @products = Product.where("price < ?", 45)
    else
      @products = Product.all
    end
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
    flash[:success] = "#{@products.name} has been created!"
    redirect_to "/products/#{@products.id}"
  end

  def new
    render 'new.html.erb'
  end

  def edit
    @products = Product.find_by(id: params[:id])
    render 'edit.html.erb'
  end

  def update
    @products = Product.find_by(id: params[:id])
    @products.update(
    name: params[:name],
    price: params[:price],
    image: params[:image],
    description: params[:description]
    )
    @products.save
    flash[:success] = "#{@products.name} has been updated!"
    redirect_to "/products/#{@products.id}"
  end

  def destroy
    @product = Product.find_by(id: params[:id])
    @product.destroy
    flash[:success] = "#{@products.name} has been deleted!"
    redirect_to "/products/#{@products.id}"
  end

end
