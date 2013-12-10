class AddLocationToRecruiters < ActiveRecord::Migration
  def change
    add_column :recruiters, :location, :string
  end
end
