class AddCandidateIdToEvents < ActiveRecord::Migration
  def change
    add_column :events, :candidate_id, :string
    add_column :events, :recruiter_id, :string
  end
end
