class TradersController < ApplicationController
  before_action :set_trader, only: %i[ show edit update destroy ]

  # GET /traders or /traders.json
  def index
    @traders = Trader.all
  end

  # GET /traders/new
  def new
    @trader = Trader.new
  end

  # POST /traders or /traders.json
  def create
    @trader = Trader.new(trader_params)
    if @trader.save
      redirect_to traders_path
    else
      render "new"
    end
  end

  # DELETE /traders/1 or /traders/1.json
  def destroy
    @trader.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trader
      @trader = Trader.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def trader_params
      params.require(:trader).permit(:name)
    end
end
