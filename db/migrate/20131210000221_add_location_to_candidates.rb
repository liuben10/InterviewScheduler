class AddLocationToCandidates < ActiveRecord::Migration
  def change
    add_column :candidates, :location, :string
  end
end
