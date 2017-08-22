class Location < ActiveRecord::Base
  has_many :flights
  has_many :forecasts




end
