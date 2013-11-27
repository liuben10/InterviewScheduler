class ChangeRecruiterIdFormatInEvents < ActiveRecord::Migration
  def change
  	change_column :events, :recruiter_id, :string
  end
end
