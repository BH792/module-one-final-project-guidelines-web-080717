require 'colorized_string'

class Console

  def print_main_menu
  puts <<-MENU
  1) Search flights
  2) Cheapest flight anywhere
  3) List Destinations
  4) Exit
  MENU
  end

  def print_welcome_message
    puts ColorizedString["\u272f" * 4 + "Farewell" + "\u272f" * 4].yellow.blink
  end

  def print_all_locations
    Location.all.each_with_index do |location, index|
      puts "#{index + 1}. #{location.name}"
    end
  end

  def main_menu_user_input_loop
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

  def search_by_location
    print "Enter Destination:  "
    location = gets.chomp
    city = Location.find_by_name_or_airport(location)

    print "\nSort By\n"
    puts "=> 1) Price \n   2) Travel Time\n   3) Departure Time"
    print "Change sort category (enter new number or N):"
    sort_choice = gets.chomp
    print_search_results(sort_flight_from_user_input(city, sort_choice))
  end

  def cheapest_flight_random_location
    random_locale = Location.random_locale
    print_single_result(random_locale.cheapest_flight_for_this_location)
  end

  def sort_flight_from_user_input(city, sort_choice)
    if sort_choice.downcase == "n" || sort_choice == "1"
      city.order_flights_by
    elsif sort_choice == "2"
      city.order_flights_by("travel_time")
    elsif sort_choice == "3"
      city.order_flights_by("departure_time")
    end
  end

  def print_single_result(result)
    puts "-------------------"
    puts "| Price       #{results.price}|"
    puts "| Travel Time #{results.travel_time} |"
    puts "-------------------"
    puts ""
  end

  def print_search_results(results_array)
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

  def farewell_message
    message = "Farewell...".split("")
    (message.length).times do
      print message.shift
      sleep(0.25)
    end
    print "\n"
  end
end
