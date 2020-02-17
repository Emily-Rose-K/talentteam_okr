class Milestone < ApplicationRecord
    belongs_to :project, ->  { includes :okr}
  end