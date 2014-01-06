ENV["RAILS_ENV"] = "test"

require File.expand_path("../dummy/config/environment.rb",  __FILE__)
require "rails/test_help"
require "rspec/rails"
require 'alchemy-oauth'

RSpec.configure do |config|
  config.order = 'random'
end
