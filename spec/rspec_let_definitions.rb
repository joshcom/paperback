module Paperback
  module RspecLetDefinitions
    def self.included(base)
      base.let(:client) {
        Paperback.client(
          :key    => "my_key",
          :secret => "my_secret",
          :auth_mode => :personal
        )
      }
    end
  end
end
