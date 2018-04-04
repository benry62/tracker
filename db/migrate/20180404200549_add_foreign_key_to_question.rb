class AddForeignKeyToQuestion < ActiveRecord::Migration[5.1]
  def change
    add_foreign_key :questions, :papers
  end
end
