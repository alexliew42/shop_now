class ProductsController < ApplicationController
  def index
    # Show all products
    @products = Product.all()
    render :index
  end

  def show
    # Show product by id
    @product = Product.find_by(id: params[:id])
    render :show
  end

  def update
    # update product
    @product = Product.find_by(id: params[:id])
    @product.name = params[:name] || @product.name
    @product.price = params[:price] || @product.price
    @product.image = params[:image] || @product.image
    @product.description = params[:description] || @product.description
    @product.save
    render :show
  end

  def create
    # Create product
    @product = Product.new(
      name: params[:name], 
      price: params[:price], 
      image: params[:image], 
      description: params[:description],
      category_id: params[:category_id]
    )
    @product.save
    render :show
  end

  def destroy
    @product = Product.find_by(id: params[:id])
    @product.destroy
  end
end
