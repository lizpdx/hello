require 'sinatra'
require 'sinatra/config_file'
require 'whenever'
require 'haml'
require 'curb'
require 'json'

set :bind, '0.0.0.0'

configure do 
  config_file "config/app.yml"
end  

get '/' do

  @username = settings.username
  @password = settings.password
  @url = settings.url
  @greeting = settings.username

  c = Curl::Easy.new(@url)
  c.username = @username
  c.password = @password
  c.get()
  response = c.body_str.gsub( /throw 'allowIllegalResourceCall is false.';/, '')
  @tasks = JSON.parse(response, :symbolize_names => true)[:issues]

  haml :index
end
