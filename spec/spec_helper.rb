# frozen_string_literal: true

ENV['RACK_ENV'] ||= 'test'

require 'capybara/rspec'
require_relative '../app'
require 'features/web_helpers'

require 'simplecov'
require 'simplecov-console'

Capybara.app = Bounce

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start
