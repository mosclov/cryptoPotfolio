class AddExchangeToCryptos < ActiveRecord::Migration[5.1]
  def change
    add_column :cryptos, :exchange, :string
  end
end
