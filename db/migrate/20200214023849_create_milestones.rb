class CreateMilestones < ActiveRecord::Migration[6.0]
  def change
    create_table :milestones do |t|
      t.string :name
      t.string :due_date
      t.boolean :is_done
    end
  end
end
