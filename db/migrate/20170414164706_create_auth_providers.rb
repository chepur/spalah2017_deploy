class CreateAuthProviders < ActiveRecord::Migration[5.0]
  def change
    create_table :auth_providers do |t|
      t.references :user, foreign_key: true
      t.string :provider
      t.string :uid

      t.timestamps
    end
    add_index :auth_providers, :provider
  end
end
