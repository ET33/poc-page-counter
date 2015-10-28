class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      # This may or may not be necessary
      t.integer :page_visits
      t.string :name, null: false
      t.text :text, null: false
    end
  end
end
