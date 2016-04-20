module Messenger
  module Components
    class Attachment
      def initialize
        raise 'This class is abstract!'
      end

      def build
        {
          attachment: {
            type: @type,
            payload: payload
          }
        }
      end

      def payload
        instance_values.select { |attribute, value| allowed_attribute?(attribute) && value.present? }
      end

      def allowed_attribute?(attribute)
        self.class::ATTRIBUTES.include?(attribute)
      end

      def build_elements(elements)
        elements.map { |element| element.build } if elements.present?
      end
    end
  end
end
