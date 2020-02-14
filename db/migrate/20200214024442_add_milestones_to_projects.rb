class AddMilestonesToProjects < ActiveRecord::Migration[6.0]
  def change
    add_reference :milestones, :project, index: true
  end
end
