require 'messenger/components/attachment'

module Messenger
  module Templates
    class Buttons
      include Components::Attachment

      attr_accessor :text, :buttons, :template_type

      ATTRIBUTES = %w(template_type text buttons).freeze

      def initialize(text:, buttons:)
        @type          = 'template'
        @template_type = 'button'
        @text          = text
        @buttons       = build_elements(buttons)
      end
    end
  end
end
