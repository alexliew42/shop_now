class OrdersController < ApplicationController

  def index
    @orders = current_user.orders
    render :index
  end

  def create
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
