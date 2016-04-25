module Messenger
  module Parameters
    module Callback
      %w(message delivery optin postback).each do |method|
        define_method("#{method}?") do
          type.include?(method)
        end
      end

      def type
        self.class.to_s.downcase
      end
    end
  end
end
