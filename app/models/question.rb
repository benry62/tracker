class Question < ApplicationRecord
  validates :max_score, presence: true
  validates :summary, presence: true
  validates :order, presence: true
  validates :question_number, presence: true

  validates :max_score, numericality: { only_iteger: true }
  validates :order, numericality: { only_integer: true }
  validates :question_number, uniqueness: { scope: :paper }
  validates :order, uniqueness: { scope: :paper }

  belongs_to :paper
  has_many :results


  def self.increment_order(question)
    count = 1
    ex = Question.where("paper_id = ?", question.paper_id).count
    if ex
    #get all the questions with the same paper_id
    #count them
    #set the question_order to be one more
      count = ex + 1
    end
    count
  end
end
