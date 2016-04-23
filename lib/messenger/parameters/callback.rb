module Parameters
  module Callback
    def message?
      type == 'message'
    end

    def delivery?
      type == 'delivery'
    end

    def optin?
      type == 'optin'
    end

    def postback?
      type == 'postback'
    end

    def type
      self.class.to_s.downcase
    end
  end
end
