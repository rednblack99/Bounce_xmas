# frozen_string_literal: true

def send_message
  visit '/'
  fill_in :message, with: 'Hello, world. This is a test message. Banana'
  click_button 'Send'
end
