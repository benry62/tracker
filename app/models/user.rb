class User < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness:  true
  validates :department, presence: true

  has_many :class_group_users
  has_many :class_groups, :through => :class_group_users

end
