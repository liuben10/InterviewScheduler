class AddUsernameToCandidate < ActiveRecord::Migration
  def change
    add_column :candidates, :username, :string
  end
end
