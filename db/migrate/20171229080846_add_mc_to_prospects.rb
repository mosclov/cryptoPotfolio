class AddMcToProspects < ActiveRecord::Migration[5.1]
  def change
    add_column :prospects, :mc, :string
  end
end
