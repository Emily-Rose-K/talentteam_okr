class Project < ApplicationRecord
  belongs_to :okr
  belongs_to :assignee
  has_many :milestones, :dependent => :destroy
end