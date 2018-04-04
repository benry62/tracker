class Question < ApplicationRecord
  validates :max_score, presence: true
  validates :max_score, numericality: { only_integer: true }

  belongs_to :test
end
