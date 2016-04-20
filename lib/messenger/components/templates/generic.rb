require 'messenger/components/attachment'

module Messenger
  module Templates
    class Generic < Components::Attachment
      ATTRIBUTES = %w(template_type elements).freeze

      def initialize(elements:)
        @type = 'template'
        @template_type = 'generic'
        @elements = build_elements(elements)
      end
    end
  end
end
