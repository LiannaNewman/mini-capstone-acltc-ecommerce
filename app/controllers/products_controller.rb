class ProductsController < ApplicationController
  before_action :authorize_admin!, except: [:index, :show]

  def index
    if params["sort"]
      @products = Product.order(params["sort"])
    elsif params["sort_desc"] == "whatever"
      @products = Product.order(price: :desc)
    elsif params[:discount]
      @products = Product.where("price < ?", 45)
    else
      @products = Product.all
    end
    render 'index.html.erb'
    if params[:category]
      category = Category.find_by(name: params[:category])
      @products = category.product
    end
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
    if @products.valid?
      flash[:success] = "#{@products.name} has been created!"
      redirect_to "/products/#{@products.id}"
    else
      flash[:danger] = @products.errors.full_messages
      render "new.html.erb"
    end
  end

  def new
    @products = Product.new
    render "new.html.erb"
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
    if @products.valid?
      flash[:success] = "#{@products.name} has been updated!"
      redirect_to "/products/#{@products.id}"
    else
      flash[:danger] = @products.errors.full_messages
      render "edit.html.erb"
    end
  end

  def destroy
    authorize_user!
    @product = Product.find_by(id: params[:id])
    @product.destroy
    flash[:success] = "#{@products.name} has been deleted!"
    redirect_to "/products/#{@products.id}"
  end
end
