class ProductsController < ApplicationController

  def index
    if params[:price].present? || params[:quantity].present?
      @products = Product.where('price = :price OR total_quantity = :quantity', price: params[:price].to_f,
      quantity: params[:quantity].to_i)

    elsif params[:price].present? && params[:quantity].present?
      @products = Product.where('price = :price AND total_quantity = :quantity', price: params[:price].to_f,
      quantity: params[:quantity].to_i)

    else
      @products = Product.all

    end
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to '/products'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])

    if @product.update(product_params)
      redirect_to '/products'
    else
      render :index, status: :unprocessable_entity
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to '/products', status: :see_other
  end

  private
  def product_params
    params.require(:product).permit(:title, :description, :price, :total_quantity, :quantity_in_stock, :image)
  end

end
