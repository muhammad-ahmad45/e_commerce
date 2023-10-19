class OrdersController < ApplicationController
  
  before_action :get_order, only: [:show, :update]
  after_action :send_email_and_clear_cart, only: [:create]

  def index
    @orders = Order.all
    @orders.includes(:user)
  end
  
  def new
    @order = Order.new
    Cart.where(user_id: current_user.id).includes(:line_items).first
  end

  def create
    @cart = current_user.cart
    @order = Order.new(order_params)
    @order.cart = @cart
    @order.user = current_user
    if @order.save
      redirect_to order_path(@order)
    else
      render :new
    end
  end

  def update
    if @order.update(update_params)
      redirect_to orders_path, notice: "Status of Order #{@order.id} is updated successfully."
    else
      render :index, status: :unprocessable_entity
    end
  end

  def show; end

  private

  def order_params
    params.require(:order).permit(:address, :total_bill)
  end

  def update_params
    params.require(:order).permit(:status)
  end

  def get_order
    @order = Order.find(params[:id])
  end

  def send_email_and_clear_cart
    OrderMailer.confirmation_email(@order).deliver_now
    @cart.line_items.destroy_all
  end

end
