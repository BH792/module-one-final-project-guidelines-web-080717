require_relative "./config/environment"

locations = [
  ["Atlanta", "ATL"],
  ["Los Angeles", "LAX"],
  ["Chicago", "ORD"],
  ["Dallas/Fort Worth", "DFW"],
  ["Denver", "DEN"],
  ["San Francisco", "SFO"],
  ["Las Vegas", "LAS"],
  ["Seattle/Tacoma", "SEA"],
  ["Charlotte", "CLT"],
  ["Phoenix", "PHX"],
  ["Miami", "MIA"],
  ["Orlando", "MCO"],
  ["Houston", "IAH"],
  ["Minneapolis/St.Paul", "MSP"],
  ["Boston", "BOS"],
  ["Detroit", "DTW"],
  ["Philadelphia", "PHL"],
  ["Fort Lauderdale/Miami", "FLL"],
  ["Baltimore/Washington, D.C.", "BWI"],
  ["Honolulu", "HNL"]
]

key = "AIzaSyA38Tw-M62KJwPwEWSZ06aFh5dIl-eYfYM"
date = "2017-08-22"
locations.each do |location|
  city_destination = location[0]
  airport_destination = location[1]


  jdata = <<-REQUEST
  {
    "request": {
      "slice": [
        {
          "origin": "JFK",
          "destination": "#{airport_destination}",
          "date": "#{date}"
        }
      ],
      "passengers": {
        "adultCount": 1
      },
      "solutions": 20
    }
  }
  REQUEST
  #RestClient.post(url, payload, params)
  response = RestClient.post( "https://www.googleapis.com/qpxExpress/v1/trips/search?key=#{key}", jdata, :content_type => :json, :accept => :json)

  json = JSON.parse(response.body)
  flights_array = []
  json["trips"]["tripOption"].each do |flight|
    flights_array << [flight["pricing"][0]["saleTotal"], flight["slice"][0]["duration"]]
  end

  new_location = Location.create(name: city_destination, airport: airport_destination)

  flights_array.each do |flight|
    new_location.flights.create(price: flight[0][3..-1], travel_time: flight[1])
  end

  sleep(1)

end


# RestClient.post( "https://www.googleapis.com/qpxExpress/v1/trips/search",
# {
#   "request": {
#     "slice": [
#       {
#         "origin": "JFK",
#         "destination": "LAX",
#         "date": "2017-08-22"
#       }
#     ],
#     "passengers": {
#       "adultCount": 1,
#       "infantInLapCount": 0,
#       "infantInSeatCount": 0,
#       "childCount": 0,
#       "seniorCount": 0
#     },
#     "solutions": 20,
#     "refundable": false
#   }
# }, :Key => $key
# )



# response = RestClient.get 'https://www.googleapis.com/qpxExpress/v1/trips/search'

binding.pry
1
