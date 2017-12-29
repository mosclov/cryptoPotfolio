class AddTimeToCoins < ActiveRecord::Migration[5.1]
  def change
    add_column :coins, :time, :string
  end
end
