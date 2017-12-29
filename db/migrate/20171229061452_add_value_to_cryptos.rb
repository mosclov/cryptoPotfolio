class AddValueToCryptos < ActiveRecord::Migration[5.1]
  def change
    add_column :cryptos, :value, :string, :default => "0"
  end
end
