class AddBtcToProspects < ActiveRecord::Migration[5.1]
  def change
    add_column :prospects, :btc, :string
  end
end
