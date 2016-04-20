module Messenger
  class Params
    attr_accessor :params

    def initialize(params)
      @params = params
    end

    def attachments
      messaging_entry['message']['attachments'].map { |a| a['payload']['url'] }
    end

    def text_message
      messaging_entry['message']['text']
    end

    def sender_id
      messaging_entry['sender']['id']
    end

    def recipient_id
      messaging_entry['recipient']['id']
    end

    private

    def messaging_entry
      params['entry'][0]['messaging'][0]
    end
  end
end
