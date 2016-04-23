module Messenger
  module Parameters
    class Delivery
      include Callback

      def initialize(mids: nil, watermark:, seq:)
        @mids      = mids
        @watermark = watermark
        @seq       = seq
      end
    end
  end
end
