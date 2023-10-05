class OrdersController < ApplicationController

  def index
    @orders = current_user.orders
    render :index
  end

end
