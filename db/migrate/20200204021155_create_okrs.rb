class CreateOkrs < ActiveRecord::Migration[6.0]
  def change
    create_table :okrs do |t|
      t.string :objective
      t.string :owner
      t.timestamps
    end
  end
end
