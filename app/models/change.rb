class Change < ApplicationRecord

  def self.total
    cryptos = Crypto.all.where.not(name: nil, day: true)
    @price = []
    cryptos.each do |c|
      url = HTTParty.get("https://api.coinmarketcap.com/v1/ticker/?start=0&limit=1250")
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
  end

  def self.save_it
    total
    yesterday = Change.last
    difference = @total - yesterday.past_day
    @percent = (difference / yesterday.past_day) * 100
    Change.create(past_day: @total, percentage: @percent)
  end

end
