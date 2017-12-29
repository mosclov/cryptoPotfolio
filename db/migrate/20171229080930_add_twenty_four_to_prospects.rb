class AddTwentyFourToProspects < ActiveRecord::Migration[5.1]
  def change
    add_column :prospects, :twenty_four, :string
  end
end
