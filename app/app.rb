require 'sinatra/base'
require './app/data_mapper_setup.rb'


class MakersMunch < Sinatra::Base
  run! if app_file == $0
end
