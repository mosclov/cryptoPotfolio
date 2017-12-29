class AddGlobalToCoins < ActiveRecord::Migration[5.1]
  def change
    add_column :coins, :global, :string
  end
end
