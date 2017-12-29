class AddOneToCryptos < ActiveRecord::Migration[5.1]
  def change
    add_column :cryptos, :one, :string, :default => "0"
  end
end
