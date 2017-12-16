class CreateCryptos < ActiveRecord::Migration[5.1]
  def change
    create_table :cryptos do |t|
      t.string :name
      t.integer :qty, :decimal, :precision => 14, :scale => 8
      t.integer :investment, :decimal, :precision => 8, :scale => 2

      t.timestamps
    end
  end
end
