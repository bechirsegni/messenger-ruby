module Messenger
  module Parameters
    class Postback
      include Callback

      attr_accessor :payload

      def initialize(payload:)
        @payload = payload
      end
    end
  end
end
