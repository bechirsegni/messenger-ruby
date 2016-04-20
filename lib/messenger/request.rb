module Messenger
  class Request
    def initialize(type, content, recipient_id)
      @type = Object.const_get(type)
      @content = content
      @recipient_id = recipient_id
      @body = body
    end

    def build
      add_element
      return @body
    end

    def add_element
      @body[:message].merge! @type.new(@content).to_hash
    end

    def body
      {
        recipient: { id: @recipient_id },
        message: {}
      }
    end
  end
end
