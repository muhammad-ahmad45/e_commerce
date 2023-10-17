class Api::V1::ProductsController < ApplicationController
  def index
    @products = Product.all

    if @products
      render json: {status: "SUCCESS", message: "Fetched all the products successfully", data: @products}, status: :ok
    else
      render json: @products.errors, status: :bad_request
    end
  end
end
