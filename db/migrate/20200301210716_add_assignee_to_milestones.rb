class AddAssigneeToMilestones < ActiveRecord::Migration[6.0]
  def change
    add_reference :milestones, :assignee, null: true, foreign_key: true
  end
end
