module Messenger
  module Parameters
    class Attachment
      attr_accessor :type, :url
      
      def initialize(type:, payload:)
        @type = type
        @url  = payload['url']
      end
    end
  end
end
