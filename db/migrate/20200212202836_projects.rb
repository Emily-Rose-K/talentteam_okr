class Projects < ActiveRecord::Migration[6.0]
  def change
    add_reference :projects, :okr, index: true
  end
end
