ENV['RACK_ENV'] = 'test'

require File.join(File.dirname(__FILE__), '..', 'app/app.rb')
require './app/data_mapper_setup'
require 'capybara/rspec'
require 'tilt/erb'
require 'database_cleaner'
require 'factory_girl'

require_relative './factories/user.rb'

require_relative './factories/restaurant.rb'

require_relative './helpers/new_restaurant'

require_relative './helpers/sign_in_up.rb'

Capybara.app = MakersMunch

RSpec.configure do |config|

  config.include FactoryGirl::Syntax::Methods

  config.include Capybara::DSL

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end
