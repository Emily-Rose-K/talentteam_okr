class Milestone < ApplicationRecord
    belongs_to :project, ->  {includes :okr}
    has_one :assignee
  end