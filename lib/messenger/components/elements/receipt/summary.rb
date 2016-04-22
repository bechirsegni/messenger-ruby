require 'messenger/components/element'

module Messenger
  module Elements
    class Summary
      include Components::Element

      attr_accessor :subtotal, :shipping_cost, :total_tax, :total_cost

      def initialize(subtotal: nil, shipping_cost: nil, total_tax: nil, total_cost:)
        @subtotal      = subtotal
        @shipping_cost = shipping_cost
        @total_tax     = total_tax
        @total_cost    = total_cost
      end
    end
  end
end
