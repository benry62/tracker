class Student < ApplicationRecord
  belongs_to :class_group
  has_many :results


  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :class_group, presence: true

end
