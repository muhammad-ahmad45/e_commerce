class OrdersController < ApplicationController
  
  def index
    @orders = Order.all
  end
  
  def new
    @order = Order.new
  end

  def create
    @cart = current_user.cart
    @order = Order.new(order_params)
    @order.cart = @cart
    @order.user = current_user
    if @order.save
      OrderMailer.confirmation_email(@order).deliver_now
      redirect_to order_path(@order)
      @cart.line_items.destroy_all
    else
      render :new
    end
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(update_params)
      redirect_to orders_path, method: :get, notice: "Status of Order #{@order.id} is updated successfully."
    else
      render :index, status: :unprocessable_entity
    end
  end

  def show
    @order = Order.find(params[:id])
  end

  private

  def order_params
    params.require(:order).permit(:address, :total_bill, :status)
  end

  def update_params
    params.require(:order).permit(:status)
  end
end
