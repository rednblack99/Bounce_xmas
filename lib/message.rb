class Message
  attr_reader :content, :time

  def self.create(session, content)
    session[:messages] << new(content)
  end

  def self.all(session)
    session[:messages] ||= []
  end

  def initialize(content)
    @content = content
    @time = Time.now
  end
end
