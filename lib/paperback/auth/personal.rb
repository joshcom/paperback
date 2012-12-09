module Paperback
  module Auth
    # Wraps Paperback API requests with basic authentication
    class Personal < PaperbackAuth
      def authenticate_connection(conn, parameters)
        unless parameters.include?(:key)
          parameters[:key] = configuration[:key]
        end
      end

      def configuration_valid?
        !configuration[:key].nil? 
      end

      def verify_configuration!
        unless configuration_valid?
          raise Paperback::Errors::ConfigurationError, 
            "Personal auth requires an API :key configuration options be set"
        end
      end
    end
  end
end
