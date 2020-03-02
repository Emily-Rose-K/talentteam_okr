class CreateAssignees < ActiveRecord::Migration[6.0]
  def change
    create_table :assignees do |t|
      t.string :first_name
      t.string :last_name
      t.date :birthday
      t.string :nickname
      t.string :email
      t.boolean :enable
      t.string :color
    end
  end
end
