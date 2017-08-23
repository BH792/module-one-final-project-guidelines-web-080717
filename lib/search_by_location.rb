module SearchByLocation
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

end
