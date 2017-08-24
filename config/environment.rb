require 'bundler'
Bundler.require

ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: 'db/flight_weather.sqlite3'
  )

ActiveRecord::Base.logger = false

require_all 'lib'
require_all 'app'
