class Milestone < ApplicationRecord
    belongs_to :project, ->  {includes :okr}
    belongs_to :assignee
  end