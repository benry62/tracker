class AddForeignKeyToPapers < ActiveRecord::Migration[5.1]
  def change
    add_foreign_key :papers, :tests
  end
end
