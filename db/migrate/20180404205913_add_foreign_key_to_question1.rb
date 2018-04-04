class AddForeignKeyToQuestion1 < ActiveRecord::Migration[5.1]
  def change
    add_index :questions, :paper_id

  end
end
