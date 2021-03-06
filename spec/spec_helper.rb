
ENV["RACK_ENV"] ||= 'test'

require 'capybara'
require 'capybara/dsl'
require 'akephalos'

require File.expand_path("../../config/boot", __FILE__)


RSpec.configure do |config|
  # == Mock Framework
  #
  # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
  #
  # config.mock_with :mocha
  # config.mock_with :flexmock
  # config.mock_with :rr
  config.mock_with :rspec


end
