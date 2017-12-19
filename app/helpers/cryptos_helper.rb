module CryptosHelper
  def total
    cryptos = Crypto.all.where.not(name: nil, day: true)
    @price = []
    cryptos.each do |c|
      url = HTTParty.get("https://api.coinmarketcap.com/v1/ticker/?start=0&limit=1000")
      coin = JSON.parse(url.body)
      coin.each do |x|
        if x["id"] == c.name
           @price << c.qty * x["price_usd"].to_f
        elsif x["name"] == c.name
          @price << c.qty * x["price_usd"].to_f
        elsif x["name"].titleize == c.name
          @price << c.qty * x["price_usd"].to_f
        end
      end
    end
    @total = @price.sum + 520
    return @total
  end
end
