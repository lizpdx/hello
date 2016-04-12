require 'sinatra'
require 'sinatra/config_file'
require 'whenever'
require 'haml'

set :bind, '0.0.0.0'

configure do 
  config_file "config/app.yml"
end  

get '/' do
  @greeting = settings.username
  haml :index
end
