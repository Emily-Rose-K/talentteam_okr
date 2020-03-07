class Assignee < ApplicationRecord
  has_many :milestones
  has_many :projects
  has_many :okrs

  def full_name
    "#{first_name} #{last_name}"
  end
    
end