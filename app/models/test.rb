class Test < ApplicationRecord
  has_many :papers
  has_many :assignments
  has_many :class_groups, :through => :assignments

  validates :name, presence: true
  validates :tier, presence: true
  validates :level, presence: true


end
