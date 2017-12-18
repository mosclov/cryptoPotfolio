class AddProfitToCoins < ActiveRecord::Migration[5.1]
  def change
    add_column :coins, :profit, :decimal, :precision => 8, :scale => 2
  end
end
