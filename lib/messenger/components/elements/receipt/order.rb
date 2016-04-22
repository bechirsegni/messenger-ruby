require 'messenger/components/element'

module Messenger
  module Elements
    class Order
      include Components::Element

      attr_accessor :order_number, :currency, :payment_method, :timestamp, :order_url

      def initialize(order_number:, currency:, payment_method:, timestamp: nil, order_url: nil)
        @order_number   = order_number
        @currency       = currency
        @payment_method = payment_method
        @timestamp      = timestamp
        @order_url      = order_url
      end
    end
  end
end
