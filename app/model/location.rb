class Location < ActiveRecord::Base
  has_many :flights
  has_many :forecasts


  def self.find_by_name_or_airport(name_or_airport)
    self.find_by(name: name_or_airport) ? self.find_by(name: name_or_airport) : self.find_by(airport: name_or_airport)
  end

  def order_flights_by(category="price")
    # category: travel_time, price, departure_time
    self.flights.order("#{category} ASC")
  end
<<<<<<< HEAD

  def self.random_locale
    self.flights[rand(self.all.count)]
  end

  def cheapest_flight_for_this_location
    self.flights.order("price ASC")[0]
  end
=======
>>>>>>> origin/forecast-db-seeding
end
