class AddLocationToCryptos < ActiveRecord::Migration[5.1]
  def change
    add_column :cryptos, :location, :string
  end
end
