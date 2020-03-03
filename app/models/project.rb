class Project < ApplicationRecord
  belongs_to :okr
  has_one :assignee
  has_many :milestones, :dependent => :destroy
  
end