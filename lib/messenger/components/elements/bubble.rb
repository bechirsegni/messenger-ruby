require 'messenger/components/attachment'

module Messenger
  module Elements
    class Bubble
      def initialize(title:, subtitle: nil, item_url: nil, image_url: nil, buttons: nil)
        @title = title
        @subtitle = subtitle
        @image_url = image_url
        @item_url = item_url
        @buttons = build_buttons(buttons)
      end

      def build
        instance_values.delete_if { |_attribute, value| value.nil? }
      end

      def build_buttons(buttons)
        buttons.map { |button| button.build } if buttons.present?
      end
    end
  end
end
