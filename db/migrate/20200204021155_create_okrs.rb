class CreateOkrs < ActiveRecord::Migration[6.0]
  def change
    create_table :okrs do |t|
      t.string :objective
      t.string :key_results
      t.string :owner
      t.string :project
      t.timestamps
    end
  end
end
