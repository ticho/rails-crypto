# frozen_string_literal: true

require 'nokogiri'
require 'open-uri'
require 'pry'

class StartScrap
  def initialize(site_url)
    @site_url = site_url
  end

  def perform
    page = Nokogiri::HTML(URI.open(@site_url))
    @currencies = []
    # uncomment to just test 5 cryptos during tests
    # page.css('table#currencies-all tbody tr').sample(5).each do |x|
    page.css('table#currencies-all tbody tr').each do |x|
      name = x.css('td.currency-name')[0]['data-sort']
      value = '$' + x.css('a.price')[0]['data-usd']
      @currencies.push(name: name, price: value[1..-1].to_f)
    end
    self
  end

  def save
    # save currencies in a database
    @currencies.each do |currency|
      if crypto = Crypto.find_by(name: currency[:name])
        crypto.price = currency[:price]
        crypto.save
      else
        Crypto.create(
          name: currency[:name],
          price: currency[:price]
        )
      end
    end
  end
end
