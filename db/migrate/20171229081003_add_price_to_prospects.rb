class AddPriceToProspects < ActiveRecord::Migration[5.1]
  def change
    add_column :prospects, :price, :string
  end
end
