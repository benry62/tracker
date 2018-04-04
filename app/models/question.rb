class Question < ApplicationRecord
  validates :max_score, presence: true
  validates :summary, presence: true
  validates :order, presence: true
  validates :question_number, presence: true

  validates :max_score, numericality: { only_integer: true }
  validates :order, numericality: { only_integer: true }
  validates :question_number, uniqueness: { scope: :paper }
  validates :order, uniqueness: { scope: :paper }

  belongs_to :paper


  def self.increment_order(question)
    question.order + 1
  end
end
