ENV["RACK_ENV"] ||= 'development'

require 'sinatra/base'
require './lib/message'
require './config/data_mapper'

require 'pry'

class MessageApp < Sinatra::Base
  set :sessions, true

  get '/' do
    @messages = Message.all

    erb(:index)
  end

  post '/message' do
    Message.create(content: params[:content])

    redirect '/'
  end

  get '/messages/:id' do
    @message = Message.get(params[:id])

    erb(:show)
  end
end
