class CreateChanges < ActiveRecord::Migration[5.1]
  def change
    create_table :changes do |t|

      t.timestamps
    end
  end
end
