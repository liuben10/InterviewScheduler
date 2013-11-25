class ChangeCandidateIdFormatInEvents < ActiveRecord::Migration
  def change
  	change_column :events, :candidate_id, :string
  end
end
