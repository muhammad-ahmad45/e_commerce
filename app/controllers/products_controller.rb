class ProductsController < ApplicationController

  before_action :get_params, only: [:edit, :update, :destroy]
  before_action :authenticate_user!
  
  def index
    @products = Product.all.page(params[:page])

    if params[:min_price].present?
      @products = @products.where("price >= ?", params[:min_price])
    end
    if params[:max_price].present?
      @products = @products.where("price <= ?", params[:max_price])
    end
    if params[:title].present?
      search_term = "%#{params[:title]}%"
      @products = @products.where("title LIKE ?", search_term)
    end

    @products = @products.page(params[:page])

    if @products.empty?
      @no_results_message = "No Results Found"
    end
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to products_path
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
