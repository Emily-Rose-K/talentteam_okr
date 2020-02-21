class Project < ApplicationRecord
  belongs_to :okr
  has_many :milestones, :dependent => :destroy
end