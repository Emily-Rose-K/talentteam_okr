class AddDueDateToMilestones < ActiveRecord::Migration[6.0]
  def change
    add_column :milestones, :due_date, :date
  end
end
