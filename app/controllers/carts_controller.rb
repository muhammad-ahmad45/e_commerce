class CartsController < ApplicationController
  
  before_action :set_cart, only: [:add_to_cart, :show]

  def add_to_cart
    @product = Product.find(params[:product_id])
# Check if the product is already in the cart
    @line_item = @cart.line_items.find_by(product: @product)

    if @line_item
      @line_item.increment(:quantity)
    else
      @line_item = @cart.line_items.build(product: @product, quantity: 1)
    end

    if @line_item.save
      redirect_to user_cart_path(@cart), notice: "#{@product.title} added to cart."
    else
      render '/products'
    end
  end

  def edit
  end

  def update
  end

  def show; end

  def destroy
  end

  private

  def set_cart
    if current_user.cart
      @cart = current_user.cart
    else  
      @cart = current_user.create_cart
    end 
  end  
end
