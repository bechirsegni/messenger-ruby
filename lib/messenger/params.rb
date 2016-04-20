module Messenger
  class Params
    attr_accessor :params

    def initialize(params)
      @params = params
    end

    def attachments
      params['entry'][0]['messaging'][0]['message']['attachments'].map { |a| a['payload']['url'] }
    end

    def text_message
      params['entry'][0]['messaging'][0]['message']['text']
    end

    def sender_id
      params['entry'][0]['messaging'][0]['sender']['id']
    end

    def recipient_id
      params['entry'][0]['messaging'][0]['recipient']['id']
    end
  end
end
