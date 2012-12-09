require 'json'
require 'nokogiri'

module Paperback 
  class FaradayMiddleware < Faraday::Response::Middleware
    def initialize(app)
      super(app)
    end

    def on_complete(env)
      if env[:response_headers]["content-type"]  =~ /application\/xml/
        env[:body] = Nokogiri::XML(env[:body])
      else
        env[:body] = JSON.parse(env[:body])
      end

      Paperback.logger.debug("Response Body: #{env[:body]}")
      Paperback::Errors.raise_error_for_status!(env[:status], env[:body])
      Paperback.logger.debug "Request successful!"
    end
  end
end
