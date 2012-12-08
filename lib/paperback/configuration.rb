module Paperback
  module Configuration
    MUTABLE_OPTION_KEYS = [:endpoint, :username, :password, :app, :ssl_verify]
    # These options are mutable, but their setters are manually implemented
    MUTABLE_IMPLEMENTED_OPTION_KEYS = [:auth_mode]
  end
end
