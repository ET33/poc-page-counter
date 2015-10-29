class AddSlugsToNews < ActiveRecord::Migration
  def change
    add_column :news, :slug, :string, null: false
    add_index :news, :slug, unique: true
  end
end
