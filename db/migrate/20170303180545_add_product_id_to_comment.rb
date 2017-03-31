class AddProductIdToComment < ActiveRecord::Migration[5.0]
  def change
    add_column :comments, :product_id, :integer

    add_index :comments, :product_id
  end
end
