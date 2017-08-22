class Location < ActiveRecord::Base
  has_many :flights

  def self.search_by_location_options(location, order, options = {})
  end

  def self.find_by_name_or_airport(name_or_airport)
    self.find_by(name: name_or_airport) ? self.find_by(name: name_or_airport) : self.find_by(airport: name_or_airport)
  end
end
