class Milestone < ApplicationRecord
    belongs_to :project, ->  {includes :okr}
    belongs_to :assignee
    default_scope { order(due_date: :asc)}
  end
