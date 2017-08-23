module SearchByWeather

  def print_weather_search_options
    puts ColorizedString["\u272f" * 4 + "Weather Options" + "\u272f" * 4].yellow.blink
  puts <<-MENU
  1) Search for clear weather
  2) Search for mostly clear weather
  3) Search for rainy weather
  4) Search for mostly rainy weather
  5) Exit
  MENU
  print "Select weather sort option: "
  end

  def weather_menu
    print_weather_search_options
    menu = gets.chomp
    if menu == "1"
      search_clear
    elsif menu == "2"
      search_mostly_clear
    elsif menu == "3"
      search_rainy
    elsif menu == "4"
      search_mostly_rainy
    end
    pause
  end

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
