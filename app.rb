ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require './lib/message'
require './config/data_mapper'
require 'pry'

# Runs web app
class Bounce < Sinatra::Base
  # use Rack::Session::Cookie, :key => "rack.session", :path => "/backend"
  enable :method_override
  
  get '/' do
    @messages = Message.all
    erb(:index)
  end

  post '/send_message' do
    @message = Message.create(content: params[:message])
    Tag.create(tag: params[:tag], message_id: @message.id )
    redirect '/'
  end

  get '/full_message/:id' do
    @message = Message.get(params[:id])
    erb(:full_message)
  end

  get '/edit_message/:id' do
    @message = Message.get(params[:id])
    erb(:edit_message)
  end

  put '/update_message/:id' do
    message = Message.get(params[:id])
    message.update(content: params[:message])
    redirect '/'
  end

  delete '/delete/:id' do
    message = Message.get(params[:id])
    message.destroy
    # tag = Tag.get!(message_id: message.id)
    # tag.destroy
    redirect '/'
  end

end


# 1 destrroy dependsnt
# 2 destrot associationd
# a way to destroy dependant records
