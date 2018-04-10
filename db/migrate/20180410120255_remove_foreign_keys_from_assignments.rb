class RemoveForeignKeysFromAssignments < ActiveRecord::Migration[5.1]
  def change
    remove_foreign_key :assignments, :papers
    remove_foreign_key :assignments, :students
  end
end
