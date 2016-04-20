module Messenger
  module Components
    class Attachment
      def to_hash
        {
          attachment: {
            type: @type,
            payload: payload
          }
        }
      end
    end
  end
end
