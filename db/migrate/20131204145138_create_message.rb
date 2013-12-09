class CreateMessage < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :title
      t.string :from
      t.string :to
      t.text :content
      t.timestamps
    end
  end
end
