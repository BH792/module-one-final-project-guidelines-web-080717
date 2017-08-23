require 'colorized_string'

class CommandLine
  extend SearchByWeather, SearchByLocation

  def self.print_main_menu
  puts <<-MENU
  1) Search flights by location
  2) Search flights by weather
  3) Cheapest flight to random location
  4) This is the cheapest flight
  5) List Destinations
  6) Exit
  MENU
  print "Select number: "
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
    while menu != "6"
      system "clear"
      print_welcome_message
      print_main_menu
      menu = gets.chomp
      if menu == "1"
        system "clear"
        search_by_location
        pause
      elsif menu == "2"
        system "clear"
        weather_menu
      elsif menu == "3"
        system "clear"
        cheapest_flight_random_location
        pause
      elsif menu == "4"
        system "clear"
        cheapest_flight_ever
        pause
      elsif menu == "5"
        system "clear"
        print_all_locations
        pause
      end
    end
    farewell_message
  end

  def self.pause
    STDIN.getch
  end

  def self.display_single_flight(flight)
    location = flight.location
    puts ColorizedString["\u272f" * 4 + "You're going to #{location.name}" + "\u272f" * 4].yellow.blink
    puts
    print_airline_cards([flight])
    puts
    forecast = location.week_forecast
    print_weather_display(forecast)
  end

  def self.cheapest_flight_ever
    display_single_flight(Flight.cheapest_flight[0])
  end

  def self.cheapest_flight_random_location
    random_locale = Location.random_locale
    display_single_flight(random_locale.cheapest_flight_for_this_location)
  end

  def self.farewell_message
    system "clear"
    message = ["F", "a", "r", "e", "w", "e", "l", "l", " ", "\u2708", " ", "\u2708", " ", "\u2708"]
    for i in 1..3 do
      print ColorizedString["    " * i + "\n" + "    " * i + " \u2708\r"].red
      sleep(0.5)
    end
    (message.length).times do
      print ColorizedString[message.shift].yellow
      sleep(0.25)
    end
    puts
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
    strings = Array.new(4, "")
    weather_array.each do |day|
      strings[0] += "|" + "\u203E" * 9 + "|"
      strings[1] += "|    #{to_unicode(day[2])}    |"
      strings[2] += "|#{temp_to_string_min(day[0])}\u00B0/#{temp_to_string_max(day[1])}|"
      strings[3] += "|_________|"
    end
    strings.each { |str| puts ColorizedString[str].blue.on_light_white }
  end

  def self.with_spacing(attrib)
    "#{attrib}" + " " * [(13 - attrib.to_s.length),0].max
  end

  def self.print_airline_cards(flight_results = [])
    strings = Array.new(7, "")
    flight_results.each do |flight|
      strings[0] += "     " + ColorizedString["|" + "\u203E" * 28 + "|"].on_light_white
      strings[1] += "     " + ColorizedString["|  " + ColorizedString["JFK  \u2708  #{flight.location.airport}"].blue + " "*15+"|"].on_light_white
      strings[2] += "     " + ColorizedString["|  Airline:     " + with_spacing(flight.airline) +"|"].on_light_white
      strings[3] += "     " + ColorizedString["|  Price:       " + with_spacing(flight.price) +"|"].on_light_white
      strings[4] += "     " + ColorizedString["|  Duration:    " + with_spacing(flight.travel_time) +"|"].on_light_white
      strings[5] += "     " + ColorizedString["|  Departure:   " + with_spacing(flight.departure_time) +"|"].on_light_white
      strings[6] += "     " + ColorizedString["|" + "_" * 28 + "|"].on_light_white
    end
    strings.each { |str| puts str}
  end
end
