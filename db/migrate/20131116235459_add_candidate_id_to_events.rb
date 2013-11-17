class AddCandidateIdToEvents < ActiveRecord::Migration
  def change
    add_column :events, :candidate_id, :int
    add_column :events, :recruiter_id, :int
  end
end
