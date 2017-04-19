class AddCommentsCountToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :api, :comments_count, :integer, default: 0
  end
end
