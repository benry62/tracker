class AddForeignKeysToAssignmentsTable < ActiveRecord::Migration[5.1]
  def change
    add_foreign_key :assignments, :tests
    add_foreign_key :assignments, :class_groups
  end
end
