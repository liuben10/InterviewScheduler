class AddPasswordToCandidate < ActiveRecord::Migration
  def change
    add_column :candidates, :password, :string
    add_column :candidates, :phonenumber, :string
    add_column :candidates, :graduationdate, :string
    add_column :candidates, :events, :text
  end
end
