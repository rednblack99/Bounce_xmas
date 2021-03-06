require 'data_mapper'
require './lib/tag'

# Creates the table of stored messages
class Message
  include DataMapper::Resource

  property :id, Serial
  property :content, Text
  property :created_at, DateTime

  has n, :tags, constraint: :destroy

  before :destroy do 
    tags.destroy
  end


  def preview
    content[0..19]
  end

  def display_time
    created_at.strftime('%d-%m-%Y | %H:%M')
  end

end

