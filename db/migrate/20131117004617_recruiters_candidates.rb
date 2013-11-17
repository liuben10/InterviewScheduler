class RecruitersCandidates < ActiveRecord::Migration
  def change
    create_table 'candidates_recruiters', :id => false do |t|
      t.column :candidate_id, :integer
      t.column :recruiter_id, :integer
    end
  end
end
