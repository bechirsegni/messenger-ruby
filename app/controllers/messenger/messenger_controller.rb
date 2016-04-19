module Messenger
  class MessengerController < ApplicationController
    def validate
      if params["hub.verify_token"] == Messenger.config.verify_token
         render json: params["hub.challenge"]
      else
        render json: 'Error, wrong validation token'
      end
    end

    def webhook
      #here user will be able to define bot behaviour
    end
  end
end
