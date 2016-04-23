module Messenger
  module Parameters
    class Messaging
      def initialize(sender:, recipient:, timestamp:, message: nil, delivery: nil, postback: nil, optin: nil)
        @sender_id = sender['id']
        @recipient_id = recipient['id']
        @callback = set_callback(message: message, delivery: delivery, postback: postback, optin: optin)
      end

      def set_callback(callbacks)
        type = callbacks.select { |_, v| v.present? }.keys.first
        @callback = constant(type).new(callbacks[type].symbolize_keys)
      end

      private

      def constant(symbol)
        "Messenger::Parameters::#{symbol.to_s.camelize}".constantize
      end
    end
  end
end
