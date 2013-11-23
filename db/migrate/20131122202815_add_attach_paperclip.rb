class AddAttachPaperclip < ActiveRecord::Migration
  def self.up
    add_column :candidates, :attach_file_name,    :string
    add_column :candidates, :attach_content_type, :string
    add_column :candidates, :attach_file_size,    :integer
    add_column :candidates, :attach_updated_at,   :datetime
  end

  def self.down
    remove_column :candidates, :attach_file_name
    remove_column :candidates, :attach_content_type
    remove_column :candidates, :attach_file_size
    remove_column :candidates, :attach_updated_at
  end
end
