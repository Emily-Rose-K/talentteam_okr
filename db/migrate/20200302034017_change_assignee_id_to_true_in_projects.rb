class ChangeAssigneeIdToTrueInProjects < ActiveRecord::Migration[6.0]
  def change
    change_column :projects, :assignee_id, :bigint, null:true
  end
end
