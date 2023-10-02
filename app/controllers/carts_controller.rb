class CartsController < ApplicationController
  def new
  end

  def create
    @user = User.find(params[:id])
    @cart = @user.cart.create()
  end

  def edit
  end

  def update
  end

  def show
  end

  def destroy
  end
end
