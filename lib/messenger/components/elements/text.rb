module Messenger
  module Elements
    class Text
      attr_accessor :text

      def initialize(text:)
        @text = text
      end

      def build
        instance_values
      end
    end
  end
end
