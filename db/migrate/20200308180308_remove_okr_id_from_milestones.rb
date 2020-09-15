class RemoveOkrIdFromMilestones < ActiveRecord::Migration[6.0]
  def change

    remove_column :milestones, :okr_id, :integer
  end
end
