class AddPercentageToChanges < ActiveRecord::Migration[5.1]
  def change
    add_column :changes, :percentage, :decimal, :precision => 8, :scale => 2
  end
end
