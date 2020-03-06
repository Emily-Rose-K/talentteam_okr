class RemoveDueDateFromMilestones < ActiveRecord::Migration[6.0]
  def change

    remove_column :milestones, :due_date, :string
  end
end
