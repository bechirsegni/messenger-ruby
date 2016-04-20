require 'messenger/components/element'

module Messenger
  module Elements
    class Adjustment < Components::Element
      def initialize(name: nil, amount: nil)
        @name = name
        @amount = amount
      end
    end
  end
end
