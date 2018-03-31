class CreateTests < ActiveRecord::Migration[5.1]
  def change
    create_table :tests do |t|
      t.string :name
      t.date :date
      t.string :tier
      t.timestamps
    end
  end
end
