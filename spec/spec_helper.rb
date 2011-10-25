require 'rubygems'
require File.expand_path('../../config/application', __FILE__)

Bundler.setup(:default, :test)

require 'sinatra'
require 'rspec'
require 'rack/test'

# set test environment
Sinatra::Base.set :environment, :test
Sinatra::Base.set :run, false
Sinatra::Base.set :raise_errors, true
Sinatra::Base.set :logging, false

# establish in-memory database for testing
DataMapper.setup(:default, "sqlite3::memory:")

Spec::Runner.configure do |config|
  # reset database before each example is run
  config.before(:each) { DataMapper.auto_migrate! }
end
