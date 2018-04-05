class Paper < ApplicationRecord
  belongs_to :test
  has_many :questions

  has_many :assignments
  has_many :students, :through => :assignments



  validates :name, presence: true
  validates :name, uniqueness:  { scope: :test}
end
