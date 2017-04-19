class AddLikesToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :api, :like, :text
  end
end
