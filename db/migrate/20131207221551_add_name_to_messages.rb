class AddNameToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :title, :string
    add_column :messages, :from, :string
    add_column :messages, :to, :string
    add_column :messages, :content, :text
  end
end
