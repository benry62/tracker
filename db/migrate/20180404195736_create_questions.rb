class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.integer :max_score
      t.integer :paper_id
      t.string :content
      t.string :tier
      t.string :strand
      t.string :summary
      t.string :MW_number
      t.string :MW_text

      t.timestamps
    end
  end
end
