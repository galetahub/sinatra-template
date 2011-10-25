require 'rubygems'
require 'bundler/setup'
require 'sinatra'
require File.expand_path('../environment', __FILE__)

use Rack::Session::Cookie
