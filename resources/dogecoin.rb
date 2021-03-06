require 'yajl'
require 'open-uri'
require 'openssl'

class Dogecoin < Rubot::WebResource
  def self.price
    lol = open('https://coinedup.com/OrderBook?market=DOGE&base=BTC', ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE).read
    lol = lol.split(/DOGE\/BTC<div style='font-size:0.85em;text-align:center'>\(last:/).last
    lol.split(")</div>").first.strip
  end

  def self.price_of(number)
    number.to_f * price.to_f
  end
end
