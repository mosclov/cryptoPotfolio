class ChangeTotalToDecimalInCoins < ActiveRecord::Migration[5.1]
  def change
    change_column :coins, :total, 'numeric USING CAST(total AS numeric(8,2))'
  end
end
