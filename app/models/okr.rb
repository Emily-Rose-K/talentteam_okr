class Okr < ApplicationRecord
  has_many :projects, :dependent => :destroy
  has_many :milestones, through: :projects
end
