class AddNewColumnsToTests < ActiveRecord::Migration[5.1]
  def change
    add_column :tests, :level, :string
  end
end
