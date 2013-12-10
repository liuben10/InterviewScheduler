class AddSummaryToCandidates < ActiveRecord::Migration
  def change
    add_column :candidates, :summary, :string
  end
end
