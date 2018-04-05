class CreateClassGroupUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :class_group_users do |t|
      t.references :user, foreign_key: true
      t.references :class_group, foreign_key: true

      t.timestamps
    end
  end
end
