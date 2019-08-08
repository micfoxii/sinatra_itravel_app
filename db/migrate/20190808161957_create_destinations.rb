class CreateDestinations < ActiveRecord::Migration
  def change
    create_table :destinations do |t|
      t.string :city
      t.string :state
      t.string :country
      t.text :trip_description
      t.string :slept_at
      t.text :slept_details
      t.string :restaurant_fav
      t.text :restaurant_details
      t.string :attraction_fav
      t.text :attraction_details
      t.text :recommendations
      t.integer :user_id
      
      t.timestamps null: false
    end
  end
end
