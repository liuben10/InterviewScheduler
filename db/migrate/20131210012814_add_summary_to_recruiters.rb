class AddSummaryToRecruiters < ActiveRecord::Migration
  def change
    add_column :recruiters, :summary, :string
  end
end
