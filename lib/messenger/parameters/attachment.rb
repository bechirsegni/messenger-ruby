module Messenger
  module Parameters
    class Attachment
      attr_accessor :type, :url, :long, :lat

      def initialize(type:, payload:)
        @type = type
        set_payload_attributes(payload)
      end

      private

      def set_payload_attributes(payload)
        if @type == 'location'
          @long = payload['coordinates']['long']
          @lat  = payload['coordinates']['lat']
        else
          @url = payload['url']
        end
      end
    end
  end
end
