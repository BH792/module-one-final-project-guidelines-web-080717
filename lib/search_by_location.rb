module SearchByLocation
  def search_by_location
    destination = false
    while !destination
      destination = get_destination
    end

    print_sort_options
    sort_choice = gets.chomp
    results = sort_flight_from_user_input(destination, sort_choice).to_a
    card_pairs = (results.length / 2.0).ceil
    system "clear" if !results.empty?
    print_weather_display(results[0].location.week_forecast) if !results.empty?
    case card_pairs
    when 0
      puts "No flights found"
    when 1
      print_airline_cards(results.shift(2))
    when 2
      print_airline_cards(results.shift(2))
      print_airline_cards(results.shift(2))
    else
      print_airline_cards(results.shift(2))
      print_airline_cards(results.shift(2))
      print "Show rest (y/n)? "
      answer = gets.chomp
      if answer == "y"
        (card_pairs - 2).times do
          print_airline_cards(results.shift(2))
        end
      end
    end
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



  def sort_flight_from_user_input(city, sort_choice)
    if sort_choice.downcase == "n" || sort_choice == "1"
      city.order_flights_by("price")
    elsif sort_choice == "2"
      city.order_flights_by("travel_time")
    elsif sort_choice == "3"
      city.order_flights_by("departure_time")
    end
  end
end
