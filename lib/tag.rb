class Tag
  include DataMapper::Resource

  property :id, Serial
  property :tag, Text

  belongs_to :message

end


# <%= message.tags %> -->
# <%= tag.message_id[message.id] %> 


# Tag: <%= @tags.each do |tag|
#       (:message_id => message.id) %>
