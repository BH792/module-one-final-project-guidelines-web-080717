class Location < ActiveRecord::Base
  has_many :flights
  has_many :forecasts


  def self.find_by_name_or_airport(name_or_airport)
    self.find_by(name: name_or_airport) ? self.find_by(name: name_or_airport) : self.find_by(airport: name_or_airport)
  end

  def order_flights_by(category="price")
    # category: travel_time, price, departure_time
    self.flights.order("#{category} ASC")
  end

  def self.random_locale
    self.all[rand(self.all.count)]
  end

  def cheapest_flight_for_this_location
    self.flights.order("price ASC")[0]
  end

  def week_forecast #array comes in [[min, max, desciptor] x 7]
    forecast = Forecast.where(location_id: self.id)
    array = []
    forecast.each do |daily_forecast|
      min = daily_forecast.min_temp
      max = daily_forecast.max_temp
      descriptor = daily_forecast.main_weather
      array << [min, max, descriptor]
    end
    array
  end
end
