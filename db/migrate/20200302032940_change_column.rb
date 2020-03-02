class ChangeColumn < ActiveRecord::Migration[6.0]
  def change
    change_column :okrs, :assignee_id, :bigint, null:true
  end
end
