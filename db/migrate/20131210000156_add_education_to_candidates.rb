class AddEducationToCandidates < ActiveRecord::Migration
  def change
    add_column :candidates, :education, :string
  end
end
