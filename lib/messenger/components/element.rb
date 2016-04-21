module Messenger
  module Components
    class Element
      def initialize
        raise 'This class is abstract!'
      end

      def build
        instance_values.delete_if { |_attribute, value| value.nil? }
      end
    end
  end
end
