class AddPasswordToRecruiter < ActiveRecord::Migration
  def change
    add_column :recruiters, :password, :string
    add_column :recruiters, :phonenumber, :string
    add_column :recruiters, :descr, :text
    add_column :recruiters, :events, :text
  end
end
