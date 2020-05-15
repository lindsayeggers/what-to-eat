class CreateRestaurants < ActiveRecord::Migration[6.0]
  def change
    create_table :restaurants do |t|
      t.json :restaurants
      t.timestamps
    end
  end
end
