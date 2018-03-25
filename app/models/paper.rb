class Paper < ApplicationRecord
  belongs_to :test

  validates :name, presence: true
  validates :name, uniqueness:  true

end
