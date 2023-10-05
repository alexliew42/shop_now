class ProductsController < ApplicationController
  def index
    @products = Product.all()
    render :index
  end

  def show
    @product = Product.find_by(id: params[:id])
    render :show
  end

  def update
    @product = Product.find_by(id: params[:id])
    @product.name = params[:name] || @product.name
    @product.price = params[:price] || @product.price
    @product.image = params[:image] || @product.image
    @product.description = params[:description] || @product.description
    @product.save
    render :show
  end

  def create
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
