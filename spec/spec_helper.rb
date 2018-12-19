ENV["RACK_ENV"] ||= 'test'

require 'capybara/rspec'
require './app'


Capybara.app = MessageApp
