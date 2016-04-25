module Messenger
  module Parameters
    class Delivery
      include Callback

      attr_accessor :mids, :watermark, :seq

      def initialize(mids: nil, watermark:, seq:)
        @mids      = mids
        @watermark = watermark
        @seq       = seq
      end
    end
  end
end
