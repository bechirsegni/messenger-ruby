module Messenger
  module Parameters
    class Optin
      include Callback

      attr_accessor :ref

      def initialize(ref:)
        @ref = ref
      end
    end
  end
end
