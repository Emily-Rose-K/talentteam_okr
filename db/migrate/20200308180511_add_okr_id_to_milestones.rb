class AddOkrIdToMilestones < ActiveRecord::Migration[6.0]
  def change
    add_column :milestones, :okr_id, :bigint
  end
end
