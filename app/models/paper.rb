class Paper < ApplicationRecord
  belongs_to :test
  has_many :questions


  validates :name, presence: true
  validates :name, uniqueness:  { scope: :test}



  def to_csv(questions, students)
    #write headers
    desired_columns = ["student_id", "last_name", "first_name"]
    questions.each do |q|
      desired_columns << q.question_number
    end
    CSV.generate() do |csv|
      csv << desired_columns
      students.each do |s|
        csv << [s.id, s.last_name, s.first_name]
      end
    end
    #pull in student details and add to CSV
  end
end
