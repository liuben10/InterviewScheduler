class AddPasswordToCandidates < ActiveRecord::Migration
  def change
    add_column :candidates, :password, :string
  end
end
