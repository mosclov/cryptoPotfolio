class AddPastDayToChanges < ActiveRecord::Migration[5.1]
  def change
    add_column :changes, :past_day, :decimal, :precision => 8, :scale => 2
  end
end
