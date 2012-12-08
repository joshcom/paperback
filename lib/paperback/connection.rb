require 'faraday'
require 'paperback/faraday_middleware'

module Paperback
  module Connection
    def reset
      @connection = nil
    end

    # Returns an existing, or new, Faraday instance.
    # If a new connection is desired, #reset must be called.
    def connection
      if self.configuration[:endpoint].nil?
        raise ConfigurationError, "No endpoint set!"
      end

      opts = {
        :url => self.configuration[:endpoint] 
      }

      @connection ||= Faraday.new(opts) do |c|
        c.use Faraday::Request::UrlEncoded  
        c.use Faraday::Response::Logger
        c.use Faraday::Adapter::NetHttp
        c.use Paperback::FaradayMiddleware
      end
    end
  end
end
