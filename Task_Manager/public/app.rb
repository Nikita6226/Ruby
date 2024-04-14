# app.rb
require 'sinatra'
require_relative 'task'

set :tasks, []
set :public_folder, File.dirname(__FILE__) + '/public'

get '/' do
  erb :index
enda# app.rb
require 'sinatra'
require_relative 'public/task'

set :tasks, []
set :views, File.join(File.dirname(__FILE__), 'public')

get '/' do
  erb :index
end

post '/add_task' do
  description = params[:description]
  settings.tasks << Task.new(description)
  redirect '/'
end
# app.rb
require 'sinatra'
require_relative 'public/task'

set :tasks, []
set :views, File.join(File.dirname(__FILE__), 'public')

get '/' do
  erb :index
end

post '/add_task' do
  description = params[:description]
  settings.tasks << Task.new(description)
  redirect '/'
end


post '/add_task' do
  description = params[:description]
  settings.tasks << Task.new(description)
  redirect '/'
end
