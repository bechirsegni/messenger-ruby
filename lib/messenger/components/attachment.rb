module Messenger
  module Components
    class Attachment
      def to_hash
        {
          attachment: {
            type: @type,
            payload: information
          }
        }
      end
    end
  end
end
