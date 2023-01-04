class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      
      t.integer :user_id, null: false
      t.string :name, null: false
      t.text :introduction, null: false
      t.string :tag, null: false
      t.integer :parking, null: false
      t.integer :season, null: false
      t.integer :transportation, null: false
      t.float :latitude, null: false
      t.float :longitude, null: false
      t.timestamps
    end
  end
end
