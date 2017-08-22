class CreateWeather < ActiveRecord::Migration[5.0]
  def change
    create_table :weather do |t|
      t.integer :location_id
      t.integer :day_of_week
      t.integer :max_temp
      t.integer :min_temp
      t.string :main_weather
    end
  end
end
