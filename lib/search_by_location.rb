module SearchByLocation
  def search_by_location
    destination = nil
    while !destination
      destination = get_destination
    end

    print_sort_options
    sort_choice = gets.chomp
    results = sort_flight_from_user_input(destination, sort_choice)
    print_airline_cards([results[0], results[1]])
    print_airline_cards([results[2], results[3]])
  end

  def print_sort_options
    print "\nSort By\n"
    puts "=> 1) Price \n   2) Travel Time\n   3) Departure Time"
    puts "Change sort category (enter new number or N):"
  end

  def get_destination
    print "Enter Destination:  "
    location = gets.chomp
    Location.find_by_name_or_airport(location)
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
end
