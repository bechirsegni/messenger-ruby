require 'messenger/components/attachment'

module Messenger
  module Components
    class ButtonTemplate < Attachment
      def initialize(text, buttons)
        @type = 'template'
        @text = text
        @buttons = build_buttons(buttons)
      end

      def payload
        { template_type: 'button',
          text: @text,
          buttons: @buttons
        }
      end

      def build_buttons(buttons)
        buttons.map { |button| button.build }
      end
    end
  end
end
