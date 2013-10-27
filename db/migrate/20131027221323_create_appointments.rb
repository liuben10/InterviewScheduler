class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.string :username
      t.string :type
      t.string :meet_with
      t.datetime :date

      t.timestamps
    end
  end
end
