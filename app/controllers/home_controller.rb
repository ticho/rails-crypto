class HomeController < ApplicationController
  def index
    @display_crypto = nil
  end

  def refresh
    scrap = StartScrap.new("https://coinmarketcap.com/all/views/all/")
    scrap.perform
    scrap.save
    @display_crypto = nil
    redirect_to root_path
  end

  def display
    @cryptos = Crypto.all
    @display_crypto = Crypto.find(params[:crypto_id])
    render :index
  end
end
