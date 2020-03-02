class ChangeAssigneeIdToTrueInMilestones < ActiveRecord::Migration[6.0]
  def change
    change_column :milestones, :assignee_id, :bigint, null:true
  end
end
