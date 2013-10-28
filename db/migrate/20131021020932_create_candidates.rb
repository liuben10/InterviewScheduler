class CreateCandidates < ActiveRecord::Migration
  def change
    create_table :candidates do |t|
      t.string :username
      t.string :password
      t.string :name
      t.string :email

      t.timestamps
    end
  end
end
