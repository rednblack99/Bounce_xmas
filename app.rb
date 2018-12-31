ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require './lib/message'
require './config/data_mapper'

require 'pry'

# Runs web app
class Bounce < Sinatra::Base
  use Rack::Session::Cookie, :key => "rack.session", :path => "/backend"
  
  get '/' do
    @messages = Message.all

    erb(:index)
  end

  post '/send_message' do
    Message.create(content: params[:message])

    redirect '/'
  end

  get '/full_message/:id' do
    $message = Message.get(params[:id])
    @message = $message
    # session[:message] = Message.get)params[:id])
    # @message = session[:message]
    erb(:full_message)
  end

  get '/edit_message' do
    erb(:edit_message)
  end

  post '/update_message' do
    # session[:message].update(content: params[:message])
    $message.update(content: params[:message])

    redirect '/'
  end

  post '/delete' do
    # session[:message].destroy
    $message.destroy

    redirect '/'
  end

end
