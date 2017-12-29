class AddValueToProspects < ActiveRecord::Migration[5.1]
  def change
    add_column :prospects, :value, :string
  end
end
