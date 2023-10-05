class CartedproductsController < ApplicationController
  def create
    @cartedproduct = CartedProduct.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      status: 'carted',
    )
    @cartedproduct.save
    render :show
  end

  def index
    if current_user
      @carted_products = CartedProduct.where(status:'carted', user_id: current_user.id)
    else
      @carted_products = {message: 'you must be logged in'}
    end
    render json: @carted_products
  end
end
