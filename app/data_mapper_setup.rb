require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-validations'



env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/makers_munch_#{env}")

require './app/models/user'
require './app/models/restaurant'
require './app/models/tag'


DataMapper.finalize

DataMapper.auto_upgrade!
