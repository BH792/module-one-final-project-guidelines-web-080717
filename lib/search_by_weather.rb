module SearchByWeather

  def print_out_weather_results(flights)
    flights.each do |flight|
      location = Location.find(flight.location_id)
      puts
      puts "#{location.name}, #{location.airport}"
      puts "$#{flight.price} / #{flight.airline} / #{flight.departure_time} / #{flight.travel_time} min"
      weekly_forecast = location.week_forecast
      self.print_weather_display(weekly_forecast)
      puts
    end
  end

  def search_clear
   flights = Forecast.clear_flights
   self.print_out_weather_results(flights)
  end

  def search_rainy
    flights = Forecast.rainy_flights
    self.print_out_weather_results(flights)
  end

  def search_mostly_clear
    flights = Forecast.mostly_clear_flights
    self.print_out_weather_results(flights)
  end

  def search_mostly_rainy
    flights = Forecast.mostly_rainy_flights
    self.print_out_weather_results(flights)
  end
end
