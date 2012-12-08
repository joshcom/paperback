module Paperback
  module Auth
    # Wraps Paperback API requests with basic authentication
    class Oauth < PaperbackAuth
      def authenticate_connection(conn)
        return if self.configured?
=begin
        conn.basic_auth(configuration[:username],
                        configuration[:password])
=end
        @configured = true
      end

      def configuration_valid?
        !configuration[:key].nil? &&
          !configuration[:secret].nil?
      end

      def verify_configuration!
        unless configuration_valid?
          raise Splunker::Errors::ConfigurationError, 
            "HttpAuth requires both :key and :secret configuration options be set"
        end
      end
    end
  end
end
