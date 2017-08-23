module SearchByWeather

  def search_by_weather_clear
   flights = Forecast.clear_locations_flights
   flights.each do |flight|
     location = Location.find(flight.location_id)
     puts
     puts "#{location.name}, #{location.airport} / $#{flight.price} / #{flight.travel_time} min"
     weekly_forecast = location.week_forecast
     self.print_weather_display(weekly_forecast)
     puts
   end
  end

end
