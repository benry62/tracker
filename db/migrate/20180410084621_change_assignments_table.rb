class ChangeAssignmentsTable < ActiveRecord::Migration[5.1]
  def change
    rename_column :assignments, :paper_id, :test_id
    rename_column :assignments, :student_id, :class_group_id

  end
end
