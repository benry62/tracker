class Paper < ApplicationRecord
  belongs_to :test
  has_many :questions

  validates :name, presence: true
  validates :name, uniqueness:  true

end
