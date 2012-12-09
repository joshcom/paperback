require 'logger'
require "paperback/version"
require "paperback/client"
require "paperback/errors"
require "paperback/models"

# The parent Paperback module can directly invoke any method invokable by the 
# client returned in Paperback.client, so long as Paperback.client has been
# called once with options to instantiate a new client.
#
# If using the helper models, you must first configure Paperback with
# Paperback.client({ :options => "..." }), as they all reference Paperback.client
# when they make requests.
module Paperback
  # Returns a reference to the current Paperback API client if no options are
  # supplied.  Otherwise, generates a new Paperback client.
  #
  # Parameters:
  # * options => See Paperback::Client's initialize method for details.
  # Returns an instance of Paperback::Client 
  def self.client(options={})
    unless options.empty?
      Thread.current[:paperback_client] = Paperback::Client.new(options)
    end

    Thread.current[:paperback_client] 
  end

  # A reference to the Paperback logger
  def self.logger
    if @logger.nil?
      @logger = Logger.new(STDOUT)
      @logger.level = Logger::INFO
    end 
    @logger
  end

  # Parameters:
  # * custom_logger => A custom logger to use instead of Logger
  def self.logger=(custom_logger)
    @logger = custom_logger
  end
  
  def self.method_missing(method,*args,&block)
    if self.client.respond_to?(method)
      return self.client.send(method,*args,&block)
    end
    super
  end
  
  def self.respond_to?(method)
    self.client.respond_to?(method) || super
  end
end
