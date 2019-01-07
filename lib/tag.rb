class Tag
  include DataMapper::Resource

  property :id, Serial
  property :tag, Text

  belongs_to :message

end