class AddAreaOfInterestToCandidates < ActiveRecord::Migration
  def change
    add_column :candidates, :area_of_interest, :string
  end
end
