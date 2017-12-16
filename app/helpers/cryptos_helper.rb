module CryptosHelper
  def total
    investment = 3000
    cryptos = Crypto.all.where.not(name: nil, day: true)
    @price = []
    cryptos.each do |c|
      url = HTTParty.get("https://api.coinmarketcap.com/v1/ticker/?start=1&limit=200")
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
    @total = @price.sum
    return @total
  end
end
