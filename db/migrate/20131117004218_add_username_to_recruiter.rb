class AddUsernameToRecruiter < ActiveRecord::Migration
  def change
    add_column :recruiters, :username, :string
  end
end
