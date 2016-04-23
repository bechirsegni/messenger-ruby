module Parameters
  class Attachment
    def initialize(type:, payload:)
      @type = type
      @url  = payload['url']
    end
  end
end
