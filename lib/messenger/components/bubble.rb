require 'messenger/components/attachment'

module Messenger
  module Components
    class Bubble
      def initialize(title, subtitle, item_url, image_url, buttons)
        @title = title
        @subtitle = subtitle
        @image_url = image_url
        @item_url = item_url
        @buttons = build_buttons(buttons)
      end

      def build
        {
          title: @title,
          subtitle: @subtitle,
          image_url: @image_url,
          item_url: @item_url,
          buttons: @buttons
        }
      end

      def build_buttons(buttons)
        buttons.map { |button| button.build }
      end
    end
  end
end
