module Messenger
  module Elements
    class Button
      def initialize(type:, title:, value:)
        @type = type
        @title = title
        @value = value
      end

      def build
        { type: @type, title: @title }.merge! eval(@type.to_s)
      end

      def web_url
        { url: @value }
      end

      def postback
        { payload: @value }
      end
    end
  end
end
