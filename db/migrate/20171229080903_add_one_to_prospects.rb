class AddOneToProspects < ActiveRecord::Migration[5.1]
  def change
    add_column :prospects, :one, :string
  end
end
