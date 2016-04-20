module Messenger
  module Elements
    class Text
      def initialize(text:)
        @text = text
      end

      def build
        instance_values
      end
    end
  end
end
