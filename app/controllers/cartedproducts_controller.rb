class CartedproductsController < ApplicationController
  def create
    # A user carts an item
    @cartedproduct = CartedProduct.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      status: 'carted',
    )
    @cartedproduct.save
    render :show
  end

  def index
    # A current user can see what items are 'carted'
    # This is how the user sees the item in their cart
    if current_user
      @carted_products = CartedProduct.where(status:'carted', user_id: current_user.id)
    else
      @carted_products = {message: 'you must be logged in'}
    end
    render json: @carted_products
  end
end
