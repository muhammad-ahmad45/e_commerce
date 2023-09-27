class ProductsController < ApplicationController
  before_action :get_params, only: [:edit, :update, :destroy]
  def index
    @products = Product.search(params).page(params[:page])
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
    
  end

  def update
    if @product.update(product_params)
      redirect_to '/products'
    else
      render :index, status: :unprocessable_entity
    end
  end

  def destroy
    @product.destroy
    redirect_to '/products', status: :see_other
  end

  private
  def product_params
    params.require(:product).permit(:title, :description, :price, :total_quantity, :quantity_in_stock, :image)
  end

  def get_params
    @product = Product.find(params[:id])
  end

end
