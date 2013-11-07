class AddCompanyToRecruiter < ActiveRecord::Migration
  def change
    add_column :recruiters, :company, :string
  end
end
