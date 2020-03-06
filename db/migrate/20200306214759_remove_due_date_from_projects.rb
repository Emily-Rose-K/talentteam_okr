class RemoveDueDateFromProjects < ActiveRecord::Migration[6.0]
  def change

    remove_column :projects, :due_date, :string
  end
end
