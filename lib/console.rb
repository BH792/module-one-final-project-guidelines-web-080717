require 'colorized_string'

module Console

  def self.print_main_menu
  puts <<-MENU
  1) Search flights
  2) Cheapest flight anywhere
  3) List Destinations
  4) Exit
  MENU
  end

  def self.print_welcome_message
    puts ColorizedString["\u272f" * 4 + "Farewell" + "\u272f" * 4].yellow.blink
  end

  def self.print_all_locations
    Location.all.each_with_index do |location, index|
      puts "#{index + 1}. #{location.name}"
    end
  end

  def self.main_menu_user_input_loop
    menu = nil
    while menu != "4"
      print_welcome_message
      print_main_menu
      menu = gets.chomp
      if menu == "1"
        search_by_location
      elsif menu == "2"
        cheapest_flight_random_location
      elsif menu == "3"
        print_all_locations
      end
    end
    farewell_message
  end

  def self.search_by_location
    print "Enter Destination:  "
    location = gets.chomp
    city = Location.find_by_name_or_airport(location)

    print "\nSort By\n"
    puts "=> 1) Price \n   2) Travel Time\n   3) Departure Time"
    print "Change sort category (enter new number or N):"
    sort_choice = gets.chomp
    print_search_results(sort_flight_from_user_input(city, sort_choice))
  end

  def self.cheapest_flight_random_location
    random_locale = Location.random_locale
    print_single_result(random_locale.cheapest_flight_for_this_location)
  end

  def self.sort_flight_from_user_input(city, sort_choice)
    if sort_choice.downcase == "n" || sort_choice == "1"
      city.order_flights_by
    elsif sort_choice == "2"
      city.order_flights_by("travel_time")
    elsif sort_choice == "3"
      city.order_flights_by("departure_time")
    end
  end

  def self.print_single_result(result)
    puts "-------------------"
    puts "| Price       #{result.price}|"
    puts "| Travel Time #{result.travel_time} |"
    puts "-------------------"
    puts ""
  end

  def self.print_search_results(results_array)
    if results_array.length >= 3
      for i in 0..2
        puts "-------------------"
        puts "| Price       #{results_array[i].price}|"
        puts "| Travel Time #{results_array[i].travel_time} |"
        puts "-------------------"
        puts ""
      end
    end

    if results_array.length > 3
      print "See All (y/n?):  "
      if gets.chomp == "y"
        for i in 0..(results_array.length - 1)
          puts "-------------------"
          puts "| Price       #{results_array[i].price}|"
          puts "| Travel Time #{results_array[i].travel_time} |"
          puts "-------------------"
          puts ""
        end
      end
    end
  end

  def self.farewell_message
    message = "Farewell...".split("")
    (message.length).times do
      print message.shift
      sleep(0.25)
    end
    print "\n"
  end

  def self.to_unicode(weather)
    case weather
    when "Rain"
      "\u2602"
    when "Clear"
      "\u2600"
    when "Clouds"
      "\u2601"
    else
      " "
    end
  end

  def self.temp_to_string_min(temp)
    if temp < 100
      " #{temp}"
    else
      "#{temp}"
    end
  end

  def self.temp_to_string_max(temp)
    if temp < 100
      "#{temp}\u00B0 "
    else
      "#{temp}\u00B0"
    end
  end

  def self.print_weather_display(weather_array)
    tt_str = ""
    tm_str = ""
    bm_str = ""
    bb_str = ""
    weather_array.each do |day|
      tt_str += "|" + "\u203E" * 9 + "|"
      tm_str += "|    #{to_unicode(day[2])}    |"
      bm_str += "|#{temp_to_string_min(day[0])}\u00B0/#{temp_to_string_max(day[1])}|"
      bb_str += "|_________|"
    end
    puts tt_str
    puts tm_str
    puts bm_str
    puts bb_str
  end

  def self.search_by_weather_clear
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

weather_array = [
  [75, 76, "Rain"],
  [75, 82, "Rain"],
  [100, 102, "Clear"],
  [79, 85, "Clear"],
  [72, 76, "Clouds"],
  [75, 77, "Clouds"],
  [70, 74, "Clouds"],
]

Console.print_weather_display(weather_array)
