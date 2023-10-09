class ProductsController < ApplicationController

  before_action :get_params, only: [:edit, :update, :destroy]
  before_action :authenticate_user!
  def index
    @products = Product.all.page(params[:page])
    if params[:min_price].present?
      @products = @products.where("price >= ?", params[:min_price]).page(params[:page])
    elsif params[:max_price].present?
      @products = @products.where("price <= ?", params[:max_price]).page(params[:page])
    elsif params[:title].present?
      @products = @products.where("title = ?", params[:title]).page(params[:page])
    else
      puts "No Result Found"
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

  def edit; end

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
