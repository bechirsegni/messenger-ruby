module Messenger
  module Components
    class Attachment
      def to_hash
        {
          attachment: {
            type: @type,
            payload: payload
          }
        }
      end

      def build_elements(elements)
        elements.map { |element| element.build }
      end
    end
  end
end
