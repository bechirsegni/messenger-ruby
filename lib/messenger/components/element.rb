module Messenger
  module Components
    module Element
      def build
        instance_values.delete_if { |_attribute, value| value.nil? }
      end
    end
  end
end
