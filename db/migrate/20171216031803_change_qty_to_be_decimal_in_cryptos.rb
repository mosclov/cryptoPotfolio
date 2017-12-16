class ChangeQtyToBeDecimalInCryptos < ActiveRecord::Migration[5.1]
  def change
    change_column :cryptos, :qty, :decimal, :precision => 14, :scale => 8
  end
end
