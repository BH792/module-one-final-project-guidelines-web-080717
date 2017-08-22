require_relative '../config/environment'

#present the user with a menu: 1)Search flights, 4)Cheapest flight anywhere
  #SEARCH
    #1)Search by location, 2)Search by weather
      #SEARCH BY LOCATION
        #=>Show users possible locations
        #Ask user for location (accepts full name or airport code)
        #Ask user if they want to sort by 1)Price, 2)Flight duration, 3)Departure time
          #=>return 3 of the flights for the next day to that location, ask if they want to see more or if they want to exit ("FareWell!")

      #SEARCH BY WEATHER
        #Ask if user wants 1)No rain or snow, 2)Mostly no rain or snow, 2)Mostly rain, 3)Mostly snow
          #=>return 3 of the locations with the cheapest flights, ask if they want to see more or if they want to exit
    #2)Cheapest flight anywhere => returns chepeast flight to any location
print "Enter location:  "
location = gets.chomp
city = Location.find_by_name_or_airport(location)

print "\nSort By\n"
puts "=> 1) Price \n   2) Travel Time\n   3) Departure Time"
print "Change sort category (enter new number or N):"
sort = gets.chomp

results = if sort.downcase == "n" || sort == "1"
  city.order_flights_by
elsif sort == "2"
  city.order_flights_by("travel_time")
else sort == "3"
  city.order_flights_by("departure_time")
end
# binding.pry

if results.length >= 3
  for i in 0..2
    puts "-------------------"
    puts "| Price       #{results[i].price}|"
    puts "| Travel Time #{results[i].travel_time} |"
    puts "-------------------"
    puts ""
  end
end

if results.length > 3
  print "See All (y/n?):  "
  if gets.chomp == "y"
    for i in 0..(results.length - 1)
      puts "-------------------"
      puts "| Price       #{results[i].price}|"
      puts "| Travel Time #{results[i].travel_time} |"
      puts "-------------------"
      puts ""
    end
  end
end
