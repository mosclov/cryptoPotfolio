class AddTotalToCryptos < ActiveRecord::Migration[5.1]
  def change
    add_column :cryptos, :total, :string, :default => "0"
  end
end
