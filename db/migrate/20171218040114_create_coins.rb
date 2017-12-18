class CreateCoins < ActiveRecord::Migration[5.1]
  def change
    create_table :coins do |t|
      t.string :total, :decimal, :precision => 8, :scale => 2

      t.timestamps
    end
  end
end
