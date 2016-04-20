module Messenger
  class Request
    def initialize(component, recipient_id)
      @recipient_id = recipient_id
      @body = body
      add_element(component)
    end

    def build
      return @body
    end

    def add_element(element)
      @body[:message].merge! element.build
    end

    def body
      {
        recipient: { id: @recipient_id },
        message: {}
      }
    end
  end
end
