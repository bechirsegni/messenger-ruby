module Parameters
  class Delivery

    def initialize(mids: nil, watermark:, seq:)
      @mids      = mids
      @watermark = watermark
      @seq       = seq
    end
  end
end
