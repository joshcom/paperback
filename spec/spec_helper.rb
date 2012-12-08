require 'rspec'
require 'webmock/rspec'
require 'paperback'
require 'rspec_let_definitions'

RSpec.configure do |config|
  config.color_enabled = true
  config.formatter     = 'documentation'
  config.include WebMock::API
  config.include Paperback::RspecLetDefinitions
end

