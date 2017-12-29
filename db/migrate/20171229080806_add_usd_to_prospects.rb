class AddUsdToProspects < ActiveRecord::Migration[5.1]
  def change
    add_column :prospects, :usd, :string
  end
end
