module Paperback
  module Auth
    # Wraps Paperback API requests with basic authentication
    class Oauth < PaperbackAuth
      def authenticate_connection(conn)
        raise RuntimeError, "OAuth not yet supported!"
      end

      def configuration_valid?
        !configuration[:key].nil? &&
          !configuration[:secret].nil?
      end

      def verify_configuration!
        unless configuration_valid?
          raise Splunker::Errors::ConfigurationError, 
            "OAuth requires both :key and :secret configuration options be set"
        end
      end
    end
  end
end
