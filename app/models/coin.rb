class Coin < ApplicationRecord
  def self.total
    coin = Coin.find(1)
    return coin.total.round(2)
  end
end
