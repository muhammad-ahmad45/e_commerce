class CartsController < ApplicationController
  
  before_action :set_cart

  def add_to_cart
    @product = Product.find(params[:product_id])
    @line_item = @cart.line_items.find_by(product: @product)

    if @line_item
      @line_item.increment(:quantity)
      @line_item.update(total_price: @line_item.quantity * @line_item.total_price)
    else
      @line_item = @cart.line_items.build(product: @product, quantity: 1, total_price: @product.price)
    end

    @line_item.save ? (redirect_to user_cart_path(@cart), notice: "#{ @product.title } added to cart.") : (render '/products')
    
  end

  def show; end

  def destroy
    @cart = Cart.find(params[:cart_id])
    @line_items = @cart.line_items
    @line_items.destroy_all
    redirect_to user_cart_path(current_user, @cart)
  end

  private

  def set_cart
    @cart = current_user.cart ? current_user.cart : current_user.create_cart
  end
 
end 
