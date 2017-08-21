require_relative "./config/environment"

$key = "AIzaSyA38Tw-M62KJwPwEWSZ06aFh5dIl-eYfYM"

jdata = <<-REQUEST
{
  "request": {
    "slice": [
      {
        "origin": "JFK",
        "destination": "LAX",
        "date": "2017-08-22"
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
response = RestClient.post( 'https://www.googleapis.com/qpxExpress/v1/trips/search?key=AIzaSyA38Tw-M62KJwPwEWSZ06aFh5dIl-eYfYM', jdata, :content_type => :json, :accept => :json)

json = JSON.parse(response.body)
flights = []
json["trips"]["tripOption"].each do |flight|
  flights << [flight["pricing"][0]["saleTotal"], flight["slice"][0]["duration"]]
end

Location.create(name: "Los Angeles", airport: "LAX")

flights.each do |flight|
  Flight.create(price: flight[0][3..-1], travel_time: flight[1], location_id: 1)
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
