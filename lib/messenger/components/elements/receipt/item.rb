require 'messenger/components/element'

module Messenger
  module Elements
    class Item
      include Components::Element

      attr_accessor :title, :subtitle, :quantity, :price, :urrency, :image_url

      def initialize(title:, subtitle: nil, quantity: nil, price: nil, currency: nil, image_url: nil)
        @title     = title
        @subtitle  = subtitle
        @quantity  = quantity
        @price     = price
        @currency  = currency
        @image_url = image_url
      end
    end
  end
end
