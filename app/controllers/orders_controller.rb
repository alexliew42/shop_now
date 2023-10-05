class OrdersController < ApplicationController

  def index
    # A user can see all of their orders
    @orders = Order.where(user_id: current_user.id)
    render :index
  end

  def create
    # A user can create an order from all of their carted products
    
    @carted_products = CartedProduct.where(status:'carted', user_id: current_user.id)
    calc_subtotal = 0
    @carted_products.each do |carted_product|
      calc_subtotal += carted_product.product.price
    end
    @order = Order.new(
      user_id: current_user.id,
      subtotal: calc_subtotal,
    )
    @order.save

    @carted_products.each do |carted_product|
      carted_product.update(
        status: 'purchased',
        order_id: @order.id
      )
    end

    render :show
  end
end
