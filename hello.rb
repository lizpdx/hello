require 'sinatra'
require 'sinatra/config_file'
require 'whenever'

config_file '/config/app_secret.yml'
set :bind, '0.0.0.0'

get '/' do
  "Hello World #{params[:name]}".strip
end
