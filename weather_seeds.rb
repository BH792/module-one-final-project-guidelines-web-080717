
require_relative "config/environment.rb"


location_ids = {
  "Atlanta" => 4180439,
  "Los Angeles" => 5344994,
  "Chicago" => 4887398,
  "Dallas/Fort Worth" => 4684888,
  "Denver" => 5419384,
  "San Francisco" => 5391997,
  "Las Vegas" => 5509403,
  "Seattle/Tacoma" => 5809844,
  "Charlotte" => 4460243,
  "Phoenix" => 5308655,
  "Miami" => 4164138,
  "Orlando" => 4167147,
  "Houston" => 4699066,
  "Minneapolis/St.Paul" => 5037649,
  "Boston" => 4317656,
  "Detroit" => 4990729,
  "Philadelphia" => 4560349,
  "Fort Lauderdale/Miami" => 4155966,
  "Baltimore/Washington, D.C." => 4347778,
  "Honolulu" => 5856195
}

location_ids.each do |location_name, location_id|
  json_data = JSON.parse(RestClient.get("http://api.openweathermap.org/data/2.5/forecast/daily?APPID=b4515c75e2c531633305d421e3511317&id=#{location_id}"))
  location_obj = Location.find_by(name: location_name)
  day_of_week = 1 #out of 7
  7.times do
    index_position = day_of_week - 1
    min_temp = json_data["list"][index_position]["temp"]["min"] #for day 1 of 7
    max_temp = json_data["list"][index_position]["temp"]["max"] #for day 1 of 7
    main_weather = json_data["list"][index_position]["weather"][0]["main"] #for day 1 of 7
    day_of_week += 1
  end
  binding.pry

end
