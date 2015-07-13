require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-validations'



env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/makers_munch_#{env}")





DataMapper.finalize

DataMapper.auto_upgrade!
