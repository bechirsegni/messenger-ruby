require 'messenger/components/attachment'

module Messenger
  module Templates
    class Buttons < Components::Attachment
      ATTRIBUTES = %w(template_type text buttons).freeze

      def initialize(text:, buttons:)
        @type = 'template'
        @template_type = 'button'
        @text = text
        @buttons = build_elements(buttons)
      end
    end
  end
end
