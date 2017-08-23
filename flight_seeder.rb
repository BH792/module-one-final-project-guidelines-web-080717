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

iata_codes = {
"Delta" => "DL",
"American Airlines" => "AA",
"JetBlue" => "B6",
"Southwest" => "WN",
"Hawaiian Airlines" => "HA" ,
"Alaskan Airlines" => "AS",
"United Airlines" => "UA",
"Allegiant Air " => "G4",
"Frontier " => "F9",
"Spirit" => "NK",
"Virgin America" => "VX"
}

key = "AIzaSyA38Tw-M62KJwPwEWSZ06aFh5dIl-eYfYM"
date = "2017-08-25"
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
          "date": "#{date}",
          "permittedCarrier": [
            "DL", "AA", "B6", "WN", "HA", "AS", "UA", "G4", "F9", "NK", "VX"
          ]
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
    flights_array << [
      flight["pricing"][0]["saleTotal"],
      flight["slice"][0]["duration"], flight["slice"][0]["segment"][0]["leg"][0]["departureTime"][11,5],
      flight["slice"][0]["segment"][0]["flight"]["carrier"]
    ]
  end

  new_location = Location.create(name: city_destination, airport: airport_destination)

  flights_array.each do |flight|
    new_location.flights.create(price: flight[0][3..-1], travel_time: flight[1], departure_time: flight[2], airline: iata_codes.key(flight[3]))
  end
end
