# frozen_string_literal: true

ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require './lib/message'
require './config/data_mapper'

require 'pry'

# Runs web app
class Bounce < Sinatra::Base
  set :sessions, true

  get '/' do
    @messages = Message.all

    erb(:index)
  end

  post '/send_message' do
    Message.create(content: params[:message])

    redirect '/'
  end

  get '/full_message/:id' do
    @message = Message.get(params[:id])

    erb(:show)
  end
end
