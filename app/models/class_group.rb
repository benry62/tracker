class ClassGroup < ApplicationRecord
  validates :name, presence: true
  validates :year, presence: true
  validates :name, uniqueness:  true
  validates :year, numericality: { only_integer: true }

  has_many :class_group_users
  
  has_many :students
  has_many :users, :through => :class_group_users

  has_many :assignments
  has_many :tests, :through => :assignments



end
