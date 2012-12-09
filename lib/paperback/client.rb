require 'paperback/configuration'
require 'paperback/auth'

module Paperback
  # The Splunk API client.
  # Methods include get, post, put, and delete HTTP helpers:
  #   c.get("...")
  # See Paperback::Request for more details.
  class Client
    include Configuration

    # Creates a new Paperback client instance.
    # Options are:
    # * :key    => Required. Your goodreads API key
    # * :secret => Required. Your goodreads API secret
    # * :auth_mode  => Required.  The authentication method to use.  :personal or :oauth
    def initialize(options={})
      self.reset

      (Configuration::MUTABLE_IMPLEMENTED_OPTION_KEYS + Configuration::MUTABLE_OPTION_KEYS).each do |key|
        self.send "#{key}=", options[key] if options.include?(key)
      end
    end

    def method_missing(method,*args,&block)
      if self.request_handler.respond_to?(method)
        return self.request_handler.send(method,*args,&block)
      end
      super
    end
    
    def respond_to?(method)
      self.request_handler.respond_to?(method) || super
    end
  end
end
