require 'messenger/components/element'

module Messenger
  module Elements
    class Bubble
      include Components::Element

      attr_accessor :title, :item_url, :image_url, :buttons

      def initialize(title:, subtitle: nil, item_url: nil, image_url: nil, buttons: nil)
        @title     = title
        @subtitle  = subtitle
        @image_url = image_url
        @item_url  = item_url
        @buttons   = build_buttons(buttons)
      end

      def build_buttons(buttons)
        buttons.map { |button| button.build } if buttons.present?
      end
    end
  end
end
