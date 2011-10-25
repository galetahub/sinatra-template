require 'rubygems'
require 'dm-core'
require 'dm-timestamps'
require 'dm-validations'
require 'dm-aggregates'
require 'dm-migrations'
require 'haml'
require 'ostruct'

require 'sinatra' unless defined?(Sinatra)

error do
  e = request.env['sinatra.error']
  Kernel.puts e.backtrace.join("\n")
  'Application error'
end

configure do
  root_path = File.dirname(File.expand_path('../', __FILE__))
  
  set :root_path, root_path
  set :views, File.join(root_path, 'views')
  set :public_folder, File.join(root_path, 'public')
  set :static, true
  
  SiteConfig = OpenStruct.new(
    :title => 'Your Application Name',
    :author => 'Your Name',
    :url_base => 'http://localhost:4567/'
  )

  # load models
  $LOAD_PATH.unshift("#{root_path}/lib")
  Dir.glob("#{root_path}/lib/*.rb") { |lib| require File.basename(lib, '.*') }

#  DataMapper::Logger.new($stdout, :debug)
               
#  DataMapper.setup(:default, (ENV["DATABASE_URL"] || "sqlite3:///#{File.expand_path(File.dirname(__FILE__))}/#{Sinatra::Base.environment}.db"))
#  DataMapper.setup(:default, "mysql://localhost/#{File.expand_path(File.dirname(__FILE__))}_#{Sinatra::Base.environment}")

end
