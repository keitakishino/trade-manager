class ProductsController < ApplicationController
  def index
  end

  def new
    @product = Product.new
    @name = name_params[:name]
  end

  private

  def name_params
    params.permit(:name)
  end
end
