# require_relative '../config/environment'
#
# raw = {
#  "kind": "qpxExpress#tripsSearch",
#  "trips": {
#   "kind": "qpxexpress#tripOptions",
#   "requestId": "01r6Bz5v3T8dmb0Lc0R8cd",
#   "data": {
#    "kind": "qpxexpress#data",
#    "airport": [
#     {
#      "kind": "qpxexpress#airportData",
#      "code": "EWR",=
#      "city": "EWR",
#      "name": "Newark Liberty International"
#     },
#     {
#      "kind": "qpxexpress#airportData",
#      "code": "JFK",
#      "city": "NYC",
#      "name": "New York John F Kennedy International"
#     },
#     {
#      "kind": "qpxexpress#airportData",
#      "code": "LAX",
#      "city": "LAX",
#      "name": "Los Angeles International"
#     },
#     {
#      "kind": "qpxexpress#airportData",
#      "code": "MSP",
#      "city": "MSP",
#      "name": "Minneapolis/St Paul International"
#     }
#    ],
#    "city": [
#     {
#      "kind": "qpxexpress#cityData",
#      "code": "EWR",
#      "name": "Newark"
#     },
#     {
#      "kind": "qpxexpress#cityData",
#      "code": "LAX",
#      "name": "Los Angeles"
#     },
#     {
#      "kind": "qpxexpress#cityData",
#      "code": "MSP",
#      "name": "Minneapolis/St Paul"
#     },
#     {
#      "kind": "qpxexpress#cityData",
#      "code": "NYC",
#      "name": "New York"
#     }
#    ],
#    "aircraft": [
#     {
#      "kind": "qpxexpress#aircraftData",
#      "code": "738",
#      "name": "Boeing 737"
#     },
#     {
#      "kind": "qpxexpress#aircraftData",
#      "code": "757",
#      "name": "Boeing 757"
#     }
#    ],
#    "tax": [
#     {
#      "kind": "qpxexpress#taxData",
#      "id": "ZP",
#      "name": "US Flight Segment Tax"
#     },
#     {
#      "kind": "qpxexpress#taxData",
#      "id": "AY_001",
#      "name": "US September 11th Security Fee"
#     },
#     {
#      "kind": "qpxexpress#taxData",
#      "id": "US_001",
#      "name": "US Transportation Tax"
#     },
#     {
#      "kind": "qpxexpress#taxData",
#      "id": "XF",
#      "name": "US Passenger Facility Charge"
#     }
#    ],
#    "carrier": [
#     {
#      "kind": "qpxexpress#carrierData",
#      "code": "SY",
#      "name": "Sun Country Airlines"
#     },
#     {
#      "kind": "qpxexpress#carrierData",
#      "code": "UA",
#      "name": "United Airlines, Inc."
#     }
#    ]
#   },
#   "tripOption": [
#    {
#     "kind": "qpxexpress#tripOption",
#     "saleTotal": "USD292.80",
#     "id": "BQz6ZaAQKsKNsQ3KAyMbNR001",
#     "slice": [
#      {
#       "kind": "qpxexpress#sliceInfo",
#       "duration": 480,
#       "segment": [
#        {
#         "kind": "qpxexpress#segmentInfo",
#         "duration": 185,
#         "flight": {
#          "carrier": "SY",
#          "number": "240"
#         },
#         "id": "Gh0yYe0XnbzaqbfZ",
#         "cabin": "COACH",
#         "bookingCode": "Z",
#         "bookingCodeCount": 6,
#         "marriedSegmentGroup": "0",
#         "leg": [
#          {
#           "kind": "qpxexpress#legInfo",
#           "id": "LarICrdaAoyFpy6U",
#           "aircraft": "738",
#           "arrivalTime": "2017-08-22T09:05-05:00",
#           "departureTime": "2017-08-22T07:00-04:00",
#           "origin": "JFK",
#           "destination": "MSP",
#           "originTerminal": "4",
#           "destinationTerminal": "2",
#           "duration": 185,
#           "mileage": 1025,
#           "meal": "Food for Purchase",
#           "secure": true
#          }
#         ],
#         "connectionDuration": 60
#        },
#        {
#         "kind": "qpxexpress#segmentInfo",
#         "duration": 235,
#         "flight": {
#          "carrier": "SY",
#          "number": "423"
#         },
#         "id": "GCSYM0A5NYhKyQXl",
#         "cabin": "COACH",
#         "bookingCode": "Z",
#         "bookingCodeCount": 4,
#         "marriedSegmentGroup": "1",
#         "leg": [
#          {
#           "kind": "qpxexpress#legInfo",
#           "id": "L6Xk8BmaEcJ0Eq+V",
#           "aircraft": "738",
#           "arrivalTime": "2017-08-22T12:00-07:00",
#           "departureTime": "2017-08-22T10:05-05:00",
#           "origin": "MSP",
#           "destination": "LAX",
#           "originTerminal": "2",
#           "destinationTerminal": "5",
#           "duration": 235,
#           "mileage": 1532,
#           "meal": "Food for Purchase",
#           "secure": true
#          }
#         ]
#        }
#       ]
#      }
#     ],
#     "pricing": [
#      {
#       "kind": "qpxexpress#pricingInfo",
#       "fare": [
#        {
#         "kind": "qpxexpress#fareInfo",
#         "id": "AZOoqOj2Zdt965PMNv7HAOWiDE1Ips4258H7TQj5g",
#         "carrier": "SY",
#         "origin": "NYC",
#         "destination": "LAX",
#         "basisCode": "ZT"
#        }
#       ],
#       "segmentPricing": [
#        {
#         "kind": "qpxexpress#segmentPricing",
#         "fareId": "AZOoqOj2Zdt965PMNv7HAOWiDE1Ips4258H7TQj5g",
#         "segmentId": "Gh0yYe0XnbzaqbfZ"
#        },
#        {
#         "kind": "qpxexpress#segmentPricing",
#         "fareId": "AZOoqOj2Zdt965PMNv7HAOWiDE1Ips4258H7TQj5g",
#         "segmentId": "GCSYM0A5NYhKyQXl"
#        }
#       ],
#       "baseFareTotal": "USD251.16",
#       "saleFareTotal": "USD251.16",
#       "saleTaxTotal": "USD41.64",
#       "saleTotal": "USD292.80",
#       "passengers": {
#        "kind": "qpxexpress#passengerCounts",
#        "adultCount": 1
#       },
#       "tax": [
#        {
#         "kind": "qpxexpress#taxInfo",
#         "id": "US_001",
#         "chargeType": "GOVERNMENT",
#         "code": "US",
#         "country": "US",
#         "salePrice": "USD18.84"
#        },
#        {
#         "kind": "qpxexpress#taxInfo",
#         "id": "AY_001",
#         "chargeType": "GOVERNMENT",
#         "code": "AY",
#         "country": "US",
#         "salePrice": "USD5.60"
#        },
#        {
#         "kind": "qpxexpress#taxInfo",
#         "id": "XF",
#         "chargeType": "GOVERNMENT",
#         "code": "XF",
#         "country": "US",
#         "salePrice": "USD9.00"
#        },
#        {
#         "kind": "qpxexpress#taxInfo",
#         "id": "ZP",
#         "chargeType": "GOVERNMENT",
#         "code": "ZP",
#         "country": "US",
#         "salePrice": "USD8.20"
#        }
#       ],
#       "fareCalculation": "NYC SY X/MSP SY LAX 251.16ZT USD 251.16 END ZP JFK MSP XT 18.84US 8.20ZP 5.60AY 9.00XF JFK4.50 MSP4.50",
#       "latestTicketingTime": "2017-08-22T06:59-04:00",
#       "ptc": "ADT"
#      }
#     ]
#    },
#    {
#     "kind": "qpxexpress#tripOption",
#     "saleTotal": "USD292.80",
#     "id": "BQz6ZaAQKsKNsQ3KAyMbNR002",
#     "slice": [
#      {
#       "kind": "qpxexpress#sliceInfo",
#       "duration": 515,
#       "segment": [
#        {
#         "kind": "qpxexpress#segmentInfo",
#         "duration": 180,
#         "flight": {
#          "carrier": "SY",
#          "number": "244"
#         },
#         "id": "GKSksYTUfkffMUBm",
#         "cabin": "COACH",
#         "bookingCode": "Z",
#         "bookingCodeCount": 6,
#         "marriedSegmentGroup": "0",
#         "leg": [
#          {
#           "kind": "qpxexpress#legInfo",
#           "id": "Lu1fXiAzH76BA+f-",
#           "aircraft": "738",
#           "arrivalTime": "2017-08-22T13:35-05:00",
#           "departureTime": "2017-08-22T11:35-04:00",
#           "origin": "JFK",
#           "destination": "MSP",
#           "originTerminal": "4",
#           "destinationTerminal": "2",
#           "duration": 180,
#           "mileage": 1025,
#           "meal": "Food for Purchase",
#           "secure": true
#          }
#         ],
#         "connectionDuration": 100
#        },
#        {
#         "kind": "qpxexpress#segmentInfo",
#         "duration": 235,
#         "flight": {
#          "carrier": "SY",
#          "number": "425"
#         },
#         "id": "GztJVnY93sUTAxCR",
#         "cabin": "COACH",
#         "bookingCode": "Z",
#         "bookingCodeCount": 6,
#         "marriedSegmentGroup": "1",
#         "leg": [
#          {
#           "kind": "qpxexpress#legInfo",
#           "id": "LxO7DKEzgsipYm-R",
#           "aircraft": "738",
#           "arrivalTime": "2017-08-22T17:10-07:00",
#           "departureTime": "2017-08-22T15:15-05:00",
#           "origin": "MSP",
#           "destination": "LAX",
#           "originTerminal": "2",
#           "destinationTerminal": "5",
#           "duration": 235,
#           "mileage": 1532,
#           "meal": "Food for Purchase",
#           "secure": true
#          }
#         ]
#        }
#       ]
#      }
#     ],
#     "pricing": [
#      {
#       "kind": "qpxexpress#pricingInfo",
#       "fare": [
#        {
#         "kind": "qpxexpress#fareInfo",
#         "id": "AZOoqOj2Zdt965PMNv7HAOWiDE1Ips4258H7TQj5g",
#         "carrier": "SY",
#         "origin": "NYC",
#         "destination": "LAX",
#         "basisCode": "ZT"
#        }
#       ],
#       "segmentPricing": [
#        {
#         "kind": "qpxexpress#segmentPricing",
#         "fareId": "AZOoqOj2Zdt965PMNv7HAOWiDE1Ips4258H7TQj5g",
#         "segmentId": "GKSksYTUfkffMUBm"
#        },
#        {
#         "kind": "qpxexpress#segmentPricing",
#         "fareId": "AZOoqOj2Zdt965PMNv7HAOWiDE1Ips4258H7TQj5g",
#         "segmentId": "GztJVnY93sUTAxCR"
#        }
#       ],
#       "baseFareTotal": "USD251.16",
#       "saleFareTotal": "USD251.16",
#       "saleTaxTotal": "USD41.64",
#       "saleTotal": "USD292.80",
#       "passengers": {
#        "kind": "qpxexpress#passengerCounts",
#        "adultCount": 1
#       },
#       "tax": [
#        {
#         "kind": "qpxexpress#taxInfo",
#         "id": "US_001",
#         "chargeType": "GOVERNMENT",
#         "code": "US",
#         "country": "US",
#         "salePrice": "USD18.84"
#        },
#        {
#         "kind": "qpxexpress#taxInfo",
#         "id": "AY_001",
#         "chargeType": "GOVERNMENT",
#         "code": "AY",
#         "country": "US",
#         "salePrice": "USD5.60"
#        },
#        {
#         "kind": "qpxexpress#taxInfo",
#         "id": "XF",
#         "chargeType": "GOVERNMENT",
#         "code": "XF",
#         "country": "US",
#         "salePrice": "USD9.00"
#        },
#        {
#         "kind": "qpxexpress#taxInfo",
#         "id": "ZP",
#         "chargeType": "GOVERNMENT",
#         "code": "ZP",
#         "country": "US",
#         "salePrice": "USD8.20"
#        }
#       ],
#       "fareCalculation": "NYC SY X/MSP SY LAX 251.16ZT USD 251.16 END ZP JFK MSP XT 18.84US 8.20ZP 5.60AY 9.00XF JFK4.50 MSP4.50",
#       "latestTicketingTime": "2017-08-22T11:34-04:00",
#       "ptc": "ADT"
#      }
#     ]
#    },
#    {
#     "kind": "qpxexpress#tripOption",
#     "saleTotal": "USD461.20",
#     "id": "BQz6ZaAQKsKNsQ3KAyMbNR003",
#     "slice": [
#      {
#       "kind": "qpxexpress#sliceInfo",
#       "duration": 350,
#       "segment": [
#        {
#         "kind": "qpxexpress#segmentInfo",
#         "duration": 350,
#         "flight": {
#          "carrier": "UA",
#          "number": "1960"
#         },
#         "id": "GJa6cwPRVslqQJ6Y",
#         "cabin": "COACH",
#         "bookingCode": "H",
#         "bookingCodeCount": 3,
#         "marriedSegmentGroup": "0",
#         "leg": [
#          {
#           "kind": "qpxexpress#legInfo",
#           "id": "LUpqJE88GMStgabs",
#           "aircraft": "757",
#           "arrivalTime": "2017-08-22T14:50-07:00",
#           "departureTime": "2017-08-22T12:00-04:00",
#           "origin": "EWR",
#           "destination": "LAX",
#           "originTerminal": "C",
#           "destinationTerminal": "7",
#           "duration": 350,
#           "onTimePerformance": 80,
#           "mileage": 2447,
#           "meal": "Food for Purchase",
#           "secure": true
#          }
#         ]
#        }
#       ]
#      }
#     ],
#     "pricing": [
#      {
#       "kind": "qpxexpress#pricingInfo",
#       "fare": [
#        {
#         "kind": "qpxexpress#fareInfo",
#         "id": "AHMtJhXe6h0RkzKhrEjSRoyEx0eEOxjNd+qEgFZjUy96",
#         "carrier": "UA",
#         "origin": "EWR",
#         "destination": "LAX",
#         "basisCode": "HAA0AGEN"
#        }
#       ],
#       "segmentPricing": [
#        {
#         "kind": "qpxexpress#segmentPricing",
#         "fareId": "AHMtJhXe6h0RkzKhrEjSRoyEx0eEOxjNd+qEgFZjUy96",
#         "segmentId": "GJa6cwPRVslqQJ6Y"
#        }
#       ],
#       "baseFareTotal": "USD415.81",
#       "saleFareTotal": "USD415.81",
#       "saleTaxTotal": "USD45.39",
#       "saleTotal": "USD461.20",
#       "passengers": {
#        "kind": "qpxexpress#passengerCounts",
#        "adultCount": 1
#       },
#       "tax": [
#        {
#         "kind": "qpxexpress#taxInfo",
#         "id": "US_001",
#         "chargeType": "GOVERNMENT",
#         "code": "US",
#         "country": "US",
#         "salePrice": "USD31.19"
#        },
#        {
#         "kind": "qpxexpress#taxInfo",
#         "id": "AY_001",
#         "chargeType": "GOVERNMENT",
#         "code": "AY",
#         "country": "US",
#         "salePrice": "USD5.60"
#        },
#        {
#         "kind": "qpxexpress#taxInfo",
#         "id": "XF",
#         "chargeType": "GOVERNMENT",
#         "code": "XF",
#         "country": "US",
#         "salePrice": "USD4.50"
#        },
#        {
#         "kind": "qpxexpress#taxInfo",
#         "id": "ZP",
#         "chargeType": "GOVERNMENT",
#         "code": "ZP",
#         "country": "US",
#         "salePrice": "USD4.10"
#        }
#       ],
#       "fareCalculation": "EWR UA LAX 415.81HAA0AGEN USD 415.81 END ZP EWR XT 31.19US 4.10ZP 5.60AY 4.50XF EWR4.50",
#       "latestTicketingTime": "2017-08-22T11:59-04:00",
#       "ptc": "ADT"
#      }
#     ]
#    }
#   ]
#  }
# }
#
# flights = []
# trips = raw[:trips][:tripOption]
# #=> array of all flights
#
# trips.each do |flight|
#   flights << [flight[:pricing][0][:saleTotal], flight[:slice][0][:duration]]
# end
# trips[0][:pricing][0][:saleTotal]
# # #=> saleTotal for first flight
# #
# trips[0][:slice][0][:duration]
# # #=> duration for first flight
# Location.create(name: "Los Angeles", airport: "LAX")
#
# flights.each do |flight|
#   Flight.create(price: flight[0][3..-1], travel_time: flight[1], location_id: 1)
# end
#
# binding.pry
#
#  1
