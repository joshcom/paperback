require 'rspec'
require 'webmock/rspec'
require 'paperback'

RSpec.configure do |config|
  config.color_enabled = true
  config.formatter     = 'documentation'
  config.include WebMock::API
end

