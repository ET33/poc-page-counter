class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.string :name, null: false
      t.text :text, null: false
    end
  end
end
