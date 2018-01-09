class Crypto < ApplicationRecord
  before_save :downcase_fields
  before_save :remove_comma
  validates :name, presence: true
  validates :qty, presence: true

  def downcase_fields
    self.name.downcase! if self.name?
  end

  def remove_comma
    self.qty.to_s.delete(',').to_f if self.qty
  end

  def self.total_coin(crypto, price)
    total = price.to_f * crypto.qty
    total.to_s
    crypto.update_attributes(total: total)
  end

  def self.value_coin(x, value)
    x.update_attributes(value: value)
  end

  def self.mc_coin(x, price)
    x.update_attributes(mc: price)
  end

  def self.one_coin(x, percent)
    x.update_attributes(one: percent)
  end

  def self.twenty_four_coin(x, percent)
    x.update_attributes(twenty_four: percent)
  end

  def self.btc(prospect, price)
    prospect.update_attributes(btc: price)
  end

  def self.pp_coin(crypto, total)
    crypto.each do |x|
      percent = ((x.total.to_f / total) * 100).round(2)
      percent.to_s
      x.update_attributes(pp: percent)
    end
  end


  def self.link
    url = HTTParty.get("https://api.coinmarketcap.com/v1/ticker/?start=0&limit=1250")
    @result = JSON.parse(url.body)
  end

  def self.market
    url = HTTParty.get("https://api.coinmarketcap.com/v1/global/")
    result = JSON.parse(url.body)
    market = result["total_market_cap_usd"]
    time = result["last_updated"]
    db = Coin.find(1)
    db.update_attributes(global: market, time: time)
  end

  def self.total
    investment = 5000.0
    crypto = Crypto.all.where.not(name: nil, day: true)
    prospect = Prospect.all
    market
    link
    @price = []
    crypto.each do |c|
      @result.each_with_index do |group,index|
        if (c.name == group["id"] || c.name == group["name"] ||  c.name == group["name"].titleize || c.name == group["symbol"] || c.name == group["symbol"].downcase && !group["name"].include?("[Futures]"))
          @price << c.qty * group["price_usd"].to_f
          total_coin(c, group["price_usd"])
          value_coin(c, group["price_usd"])
          mc_coin(c, group["market_cap_usd"])
          one_coin(c, group["percent_change_1h"])
          twenty_four_coin(c, group["percent_change_24h"])
        end
      end
    end

    prospect.each do |pros|
      @result.each_with_index do |group,index|
        if (pros.name == group["id"] || pros.name == group["name"] ||  pros.name == group["name"].titleize || pros.name == group["symbol"] || pros.name == group["symbol"].downcase && !group["name"].include?("[Futures]"))
          value_coin(pros, group["price_usd"])
          btc(pros, group["price_btc"])
          mc_coin(pros, group["market_cap_usd"])
          one_coin(pros, group["percent_change_1h"])
          twenty_four_coin(pros, group["percent_change_24h"])
        end
      end
    end

    total = @price.sum
    profit = total - investment
    pp_coin(crypto, total)
    dbsave = Coin.find(1)
    dbsave.update_attributes(total: total, profit: profit)
  end



end
