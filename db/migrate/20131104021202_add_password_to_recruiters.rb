class AddPasswordAndCompanyToRecruiters < ActiveRecord::Migration
  def change
    add_column :recruiters, :password, :string
    add_column :recruiters, :company, :string
  end
end
