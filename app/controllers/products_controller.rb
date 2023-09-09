class ProductsController < ApplicationController
  before_action :set_product, only: %i[edit update show destroy]
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
    @traders = Trader.all
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

  def edit
  end

  def show
  end

  def update
    if @product.update(update_product_params)
     flash.now.notice = "更新しました。"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @product.delete
    flash.now.notice = "削除しました。"
  end

  private

  def set_product
    @product = Product.find params[:id]
  end

  def name_params
    params.permit(:name)
  end

  def product_params
    permited = params.require(:product).permit(:name, :num, :price, :trader)
    permited[:trader] = Trader.find permited[:trader]
    permited
  end

  def update_product_params
    params.require(:product).permit(:num, :price)
  end
end
