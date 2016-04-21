require 'messenger/components/attachment'

module Messenger
  module Templates
    class Receipt < Components::Attachment
      ATTRIBUTES = %w(
        template_type
        recipient_name
        order_number
        currency
        payment_method
        timestamp
        order_url
        elements
        address
        summary
        adjustments
      ).freeze

      def initialize(recipient_name:, order:, elements:, address: nil, summary:, adjustments: nil)
        @type = 'template'
        @template_type = 'receipt'
        @recipient_name = recipient_name
        @order = order
        @elements = build_elements(elements)
        @address = address.build
        @summary = summary.build
        @adjustments = build_elements(adjustments)
      end

      def flattened_attributes
        @order.build
      end
    end
  end
end
