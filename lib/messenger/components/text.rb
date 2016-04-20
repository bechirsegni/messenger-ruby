module Messenger
  module Components
    class Text
      def initialize(text)
        @text = text
      end

      def to_hash
        { text: @text }
      end
    end
  end
end
