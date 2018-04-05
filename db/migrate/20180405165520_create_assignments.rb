class CreateAssignments < ActiveRecord::Migration[5.1]
  def change
    create_table :assignments do |t|
      t.references :paper, foreign_key: true
      t.references :student, foreign_key: true

      t.timestamps
    end
  end
end
