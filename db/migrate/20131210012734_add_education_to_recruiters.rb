class AddEducationToRecruiters < ActiveRecord::Migration
  def change
    add_column :recruiters, :education, :string
  end
end
