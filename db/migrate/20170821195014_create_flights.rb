class CreateFlights < ActiveRecord::Migration[5.0]
  def change
    create_table :flights do |t|
      t.integer :price
      t.integer :travel_time
      t.integer :location_id
      t.string :departure_time
      t.string :airline
    end
  end
end
