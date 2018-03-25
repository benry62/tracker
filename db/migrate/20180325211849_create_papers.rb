class CreatePapers < ActiveRecord::Migration[5.1]
  def change
    create_table :papers do |t|
      t.string :name
      t.integer :test_id

      t.timestamps
    end
  end
end
