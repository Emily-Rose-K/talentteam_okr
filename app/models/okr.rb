class Okr < ApplicationRecord
  has_many :projects
  has_many :milestones, through: :projects
end
