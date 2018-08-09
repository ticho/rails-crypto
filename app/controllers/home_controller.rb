class HomeController < ApplicationController
  def index
    scrap = StartScrap.new("https://coinmarketcap.com/all/views/all/")
    scrap.perform.save
    @cryptos = Crypto.all
    @display_crypto = nil
  end

  def display
    @cryptos = Crypto.all
    @display_crypto = Crypto.find(params[:crypto_id])
    render :index
  end
end
