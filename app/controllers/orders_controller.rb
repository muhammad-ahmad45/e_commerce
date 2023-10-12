class OrdersController < ApplicationController
  
  def index
    @orders = Order.all
  end
  
  def new
    @order = Order.new
    @cart = current_user.cart
  end

  def create
    @user = current_user
    @cart = current_user.cart
    @order = @cart.build_order(order_params)
    @order.user = current_user
    if @order.save
      OrderMailer.confirmation_email(@order).deliver_now
      redirect_to order_path(@order)
    else
      render :new
    end
  end

  def edit
  end

  def show
    @order = Order.find(params[:id])
    @cart = current_user.cart
  end

  private

  def order_params
    params.require(:order).permit(:address, :total_bill, status:'Dispatched')
  end
end
