class AddYesterdayToCryptos < ActiveRecord::Migration[5.1]
  def change
    add_column :cryptos, :yesterday, :decimal, :precision => 8, :scale => 2
  end
end
