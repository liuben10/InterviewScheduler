class AddPicPaperclip < ActiveRecord::Migration
  def self.up
    add_column :candidates, :pic_file_name,    :string
    add_column :candidates, :pic_content_type, :string
    add_column :candidates, :pic_file_size,    :integer
    add_column :candidates, :pic_updated_at,   :datetime
    add_column :recruiters, :pic_file_name,    :string
    add_column :recruiters, :pic_content_type, :string
    add_column :recruiters, :pic_file_size,    :integer
    add_column :recruiters, :pic_updated_at,   :datetime
  end

  def self.down
    remove_column :candidates, :pic_file_name
    remove_column :candidates, :pic_content_type
    remove_column :candidates, :pic_file_size
    remove_column :candidates, :pic_updated_at
    remove_column :recruiters, :pic_file_name
    remove_column :recruiters, :pic_content_type
    remove_column :recruiters, :pic_file_size
    remove_column :recruiters, :pic_updated_at
  end
end
