require "pry"

class Forecast < ActiveRecord::Base
  belongs_to :location

  def self.forecasts_with_no_rain
    Forecast.where("main_weather != 'Rain'")
  end

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

end
