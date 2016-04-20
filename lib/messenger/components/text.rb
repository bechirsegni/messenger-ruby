module Messenger
  module Components
    class Text
      def initialize(value)
        @value = value
      end

      def to_hash
        { text: @value }
      end
    end
  end
end
