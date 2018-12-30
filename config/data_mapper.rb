# frozen_string_literal: true

require './lib/message'

DataMapper.setup(:default, "postgres://localhost/message_app_#{ENV['RACK_ENV']}")

DataMapper.finalize

DataMapper.auto_migrate!
