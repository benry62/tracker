class AddQuestionNumberToQuestions < ActiveRecord::Migration[5.1]
  def change
    add_column :questions, :question_number, :string
  end
end