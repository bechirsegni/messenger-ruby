require 'messenger/components/attachment'

module Messenger
  module Components
    class GenericTemplate < Attachment
      def initialize(bubbles)
        @type = 'template'
        @bubbles = build_elements(bubbles)
      end

      def payload
        { template_type: 'generic',
          elements: @bubbles
        }
      end

      def build_elements(elements)
        elements.map { |element| element.build }
      end
    end
  end
end
