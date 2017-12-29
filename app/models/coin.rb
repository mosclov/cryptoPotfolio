class Coin < ApplicationRecord
  def self.total
    coin = Coin.find(1)
    return coin.total
  end
end
