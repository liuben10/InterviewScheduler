class AddPasswordToRecruiters < ActiveRecord::Migration
  def change
    add_column :recruiters, :password, :string
  end
end
