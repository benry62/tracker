class AddOrderToQuestion < ActiveRecord::Migration[5.1]
  def change
    add_column :questions, :order, :integer
  end
end
