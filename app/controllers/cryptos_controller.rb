class CryptosController < ApplicationController
  before_action :set_crypto, only: [:edit, :update, :destroy]
  include CryptosHelper

  # GET /cryptos
  # GET /cryptos.json
  def index
    @cryptos = Crypto.all.where.not(name: nil, day: true).order(:name)
    url = HTTParty.get("https://api.coinmarketcap.com/v1/ticker/?start=0&limit=1000")
    @result = JSON.parse(url.body)
    @investment = 3825.0
    total
    @profit = @total - @investment
  end

  # GET /cryptos/1
  # GET /cryptos/1.json
  def show
    @crypto = Crypto.find(params[:id])
  end

  # GET /cryptos/new
  def new
    @crypto = Crypto.new
  end

  # GET /cryptos/1/edit
  def edit
  end

  # POST /cryptos
  # POST /cryptos.json
  def create
    @crypto = Crypto.new(crypto_params)
    respond_to do |format|
      if @crypto.save
        format.html { redirect_to @crypto, notice: 'Crypto was successfully created.' }
        format.json { render :show, status: :created, location: @crypto }
      else
        format.html { render :new }
        format.json { render json: @crypto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cryptos/1
  # PATCH/PUT /cryptos/1.json
  def update
    respond_to do |format|
      if @crypto.update(crypto_params)
        format.html { redirect_to @crypto, notice: 'Crypto was successfully updated.' }
        format.json { render :show, status: :ok, location: @crypto }
      else
        format.html { render :edit }
        format.json { render json: @crypto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cryptos/1
  # DELETE /cryptos/1.json
  def destroy
    @crypto.destroy
    respond_to do |format|
      format.html { redirect_to cryptos_url, notice: 'Crypto was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_crypto
      @crypto = Crypto.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def crypto_params
      params.require(:crypto).permit(:name, :investment, :qty)
    end
end
