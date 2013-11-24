class RenameAppointmentsTypeColumn < ActiveRecord::Migration
  def change
  	rename_column :appointments, :type, :acc_type
  end
end
