class Flight < ActiveRecord::Base
  belongs_to :location

  def self.cheapest_flight
    self.all.order("price").limit(1)
  end
end
