class OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def create
    @cart = current_user.cart
    @order = @cart.create_order(order_params)
    if @order
      redirect_to '/orders', method: :get
    end
  end

  def edit
  end

  def show
  end

  private

  def order_params
    params.require(:order).permit(:address, :total_bill, status:'Dispatched')
  end
end
