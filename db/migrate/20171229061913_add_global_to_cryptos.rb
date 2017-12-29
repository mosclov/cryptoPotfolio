class AddGlobalToCryptos < ActiveRecord::Migration[5.1]
  def change
    add_column :cryptos, :global, :string, :default => "0"
  end
end
