require 'sinatra/base'
require './lib/message'

require 'pry'

class MessageApp < Sinatra::Base
  set :sessions, true

  get '/' do
    @messages = Message.all(session)
    erb(:index)
  end

  post '/message' do
    Message.create(session, params[:content])

    redirect '/'
  end
end
