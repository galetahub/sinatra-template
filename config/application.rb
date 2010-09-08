require 'rubygems'
require 'sinatra'

require File.expand_path('../boot', __FILE__)
require File.expand_path('../environment', __FILE__)
require File.expand_path('../../lib/controller', __FILE__)

Bundler.require(:default, Sinatra::Base.environment) if defined?(Bundler)
