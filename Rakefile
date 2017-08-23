require_relative 'config/environment'
require 'sinatra/activerecord/rake'

desc 'starts a console'
task :console do
  def reload!
    load_all "lib"
  end
  binding.pry
  1
end
