class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
    @name = name_params[:name]
  end

  def create
    @product = Product.new(product_params)
    @name = product_params[:name]
    if @product.save
      redirect_to cards_path
    else
      render "new"
    end
  end

  private

  def name_params
    params.permit(:name)
  end

  def product_params
    params.require(:product).permit(:name, :num, :price)
  end
end
