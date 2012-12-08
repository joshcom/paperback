module Paperback
  module Auth
    class PaperbackAuth
      include Paperback::Request

      attr_accessor :client
      attr_reader :configured

      # Parameters:
      # * client => An instance of Paperback::Client
      def initialize(client)
        self.client = client
      end

      # A helper method to access the client's configuration.
      # Returns:
      # * A Hash of the client's current configuration settings.
      def configuration
        self.client.configuration
      end

      # Child classes must implement their own logic to determine when
      # @configured is set to true.
      def configured?
        @configured == true
      end

      # Raises Paperback::Errors::ConfigurationError if configuration_valid?
      # returns false.
      def verify_configuration!
        unless configuration_valid?
          raise Paperback::Errors::ConfigurationError
        end
      end

      # By default, always returns true
      # Child classes must implement their own logic to determine when
      # the client's configuration is invalid for its needs.
      def configuration_valid?
        true
      end

      def reset
        @configured = false
      end
    end
  end
end
