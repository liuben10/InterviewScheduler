class AddPendingToEvents < ActiveRecord::Migration
  def change
    add_column :events, :pending_id, :string
  end
end
