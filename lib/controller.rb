require 'rubygems'
require 'sinatra'

helpers do
  # add your helpers here
end

# root page
get '/' do
  haml :root
end

# root page
get '/test' do
  "test"
end
