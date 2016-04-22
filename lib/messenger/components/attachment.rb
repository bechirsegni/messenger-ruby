module Messenger
  module Components
    module Attachment
      attr_accessor :type

      def build
        {
          attachment: {
            type: @type,
            payload: payload
          }
        }
      end

      def all_attributes
        return instance_values unless defined?(flattened_attributes)
        instance_values.merge! flattened_attributes
      end

      def payload
        all_attributes.select { |attribute, value| allowed_attribute?(attribute) && value.present? }
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
