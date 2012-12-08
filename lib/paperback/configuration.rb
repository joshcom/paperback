module Paperback
  module Configuration
    MUTABLE_OPTION_KEYS = [:key, :secret, :endpoint]
    READONLY_OPTION_KEYS = [:request_handler]

    DEFAULT_ENDPOINT = "https://www.goodreads.com"

    def self.included(base)
      base.class_eval do
        attr_accessor *MUTABLE_OPTION_KEYS
        attr_reader *READONLY_OPTION_KEYS
      end
    end

    def configure
      yield self end
    
    def configuration
      MUTABLE_OPTION_KEYS.inject({}) do |conf,key|
        conf.merge!(key=>self.send(key))
      end
    end

    def reset
      self.endpoint = DEFAULT_ENDPOINT
      @request_handler = Auth.create(:oauth, self)
      @key = @secret = nil
      self.request_handler.reset unless self.request_handler.nil?
    end
  end
end
