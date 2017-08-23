require 'colorized_string'

class Console
  extend SearchByWeather, SearchByLocation

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
    a_str = ""
    b_str = ""
    c_str = ""
    d_str = ""
    weather_array.each do |day|
      a_str += "|" + "\u203E" * 9 + "|"
      b_str += "|    #{to_unicode(day[2])}    |"
      c_str += "|#{temp_to_string_min(day[0])}\u00B0/#{temp_to_string_max(day[1])}|"
      d_str += "|_________|"
    end
    puts a_str
    puts b_str
    puts c_str
    puts d_str
  end

  def self.print_airline_cards(airline_results = [])
    a_str = ""
    b_str = ""
    c_str = ""
    d_str = ""
    airline_results.each do |day|
      a_str += "|" + "\u203E" * 9 + "|"
      b_str += "|    #{to_unicode(day[2])}    |"
      c_str += "|#{temp_to_string_min(day[0])}\u00B0/#{temp_to_string_max(day[1])}|"
      d_str += "|_________|"
    end
    puts a_str
    puts b_str
    puts c_str
    puts d_str
  end
end
