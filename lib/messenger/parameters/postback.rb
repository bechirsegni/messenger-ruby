module Parameters
  class Postback
    include Callback

    def initialize(payload:)
      @payload = payload
    end
  end
end
