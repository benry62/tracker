class Result < ApplicationRecord
  belongs_to :student
  belongs_to :question



  def self.to_csv(options = {})
    desired_columns = ["student_id", "question_id", "score"]
    CSV.generate(options) do |csv|
      csv << desired_columns
      all.each do |result|
        csv << result.attributes.values_at(*desired_columns)
      end
    end
  end


end
