class AddLikesToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :like, :text
  end
end
