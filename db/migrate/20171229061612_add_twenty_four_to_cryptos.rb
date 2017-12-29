class AddTwentyFourToCryptos < ActiveRecord::Migration[5.1]
  def change
    add_column :cryptos, :twenty_four, :string, :default => "0"
  end
end
