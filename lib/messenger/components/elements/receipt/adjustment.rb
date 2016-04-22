require 'messenger/components/element'

module Messenger
  module Elements
    class Adjustment
      include Components::Element

      attr_accessor :name, :amount

      def initialize(name: nil, amount: nil)
        @name   = name
        @amount = amount
      end
    end
  end
end
