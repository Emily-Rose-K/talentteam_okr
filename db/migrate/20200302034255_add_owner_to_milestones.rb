class AddOwnerToMilestones < ActiveRecord::Migration[6.0]
  def change
    add_column :milestones, :owner, :string
  end
end
