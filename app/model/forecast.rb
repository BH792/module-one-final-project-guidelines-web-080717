require "pry"

class Forecast < ActiveRecord::Base
  belongs_to :location

  def self.clear_locations #find locations where 7/7 days are not rainy or snowy
    Location.all.select do |location|
      location_id = location.id
      week_forecast = Forecast.where(location_id: location_id)
      num_clear_days = week_forecast.where("main_weather != 'Rain'").count
      num_clear_days == 7
    end
  end

  def self.rainy_locations #find locations where 7/7 days are rainy
    Location.all.select do |location|
      location_id = location.id
      week_forecast = Forecast.where(location_id: location_id)
      num_rainy_days = week_forecast.where("main_weather = 'Rain'").count
      num_rainy_days == 7
    end
  end

  def self.mostly_clear_locations #find locations where 4/7 days are not rainy
    Location.all.select do |location|
      location_id = location.id
      week_forecast = Forecast.where(location_id: location_id)
      num_clear_days = week_forecast.where("main_weather != 'Rain'").count
      num_clear_days >= 4
    end
  end

  def self.mostly_rainy_locations #find locations where 4/7 days are not rainy
    Location.all.select do |location|
      location_id = location.id
      week_forecast = Forecast.where(location_id: location_id)
      num_rainy_days = week_forecast.where("main_weather = 'Rain'").count
      num_rainy_days >= 4
    end
  end

  def self.cheapest_flight_by_weather(locations)
    locations.collect do |location|
      location.cheapest_flight_for_this_location
    end.sort_by {|obj| obj.price}
  end

  def self.clear_flights #returns cheapest flight for each all clear location
    locations = self.clear_locations
    self.cheapest_flight_by_weather(locations)
  end

  def self.rainy_flights
    locations = self.rainy_locations
    self.cheapest_flight_by_weather(locations)
  end

  def self.mostly_clear_flights
    locations = self.mostly_clear_locations
    self.cheapest_flight_by_weather(locations)
  end

  def self.mostly_rainy_flights
    locations = self.mostly_rainy_locations
    self.cheapest_flight_by_weather(locations)
  end


end
