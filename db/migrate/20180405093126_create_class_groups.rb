class CreateClassGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :class_groups do |t|
      t.string :name
      t.integer :year

      t.timestamps
    end
  end
end
