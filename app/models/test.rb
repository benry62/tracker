class Test < ApplicationRecord
  has_many :papers

  validates :name, presence: true
  validates :tier, presence: true


end
