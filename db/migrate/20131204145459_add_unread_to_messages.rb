class AddUnreadToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :unread, :int
  end
end
