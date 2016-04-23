module Messenger
  module Parameters
    class Optin
      include Callback

      def initialize(ref:)
        @ref = ref
      end
    end
  end
end
