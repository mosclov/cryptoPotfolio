class CoinsController < ApplicationController
  # GET /coins
  # GET /coins.json
  def index
    @coins = Coin.find(1)
    render json: @coins
  end
end
