class AddDayToCryptos < ActiveRecord::Migration[5.1]
  def change
    add_column :cryptos, :day, :boolean, :default => false
  end
end
