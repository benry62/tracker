class CreateResults < ActiveRecord::Migration[5.1]
  def change
    create_table :results do |t|
      t.references :student, foreign_key: true
      t.references :question, foreign_key: true
      t.integer :score

      t.timestamps
    end
  end
end
