require_relative '../config/environment'

#present the user with a menu: 1)Search flights, 4)Cheapest flight anywhere
  #SEARCH
    #1)Search by location, 2)Search by weather
      #SEARCH BY LOCATION
        #Ask user for location (accepts full name or airport code)
        #Ask user if they want to sort by 1)Price, 2)Flight duration, 3)Departure time
          #=>return 3 of the flights for the next day to that location, ask if they want to see more or if they want to exit ("FareWell!")

      #SEARCH BY WEATHER
        #Ask if user wants 1)No rain or snow, 2)Mostly no rain or snow, 2)Mostly rain, 3)Mostly snow
          #=>return 3 of the locations with the cheapest flights, ask if they want to see more or if they want to exit
    #2)Cheapest flight anywhere => returns chepeast flight to any location
