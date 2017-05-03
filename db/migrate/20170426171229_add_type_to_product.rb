class AddTypeToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :type, :string
    add_index :products, :type
  end
end
