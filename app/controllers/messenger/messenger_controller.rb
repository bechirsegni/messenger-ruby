module Messenger
  class MessengerController < ApplicationController
    def validate
      if params["hub.verify_token"] == Messenger.config.verify_token
        render json: params["hub.challenge"]
        activate_bot
      else
        render json: 'Error, wrong validation token'
      end
    end

    def webhook
      #here user will be able to define bot behaviour
    end

    private

    def activate_bot
      RestClient.post(
        "https://graph.facebook.com/v2.6/me/subscribed_apps?access_token=#{Messenger.config.page_access_token}",
        nil
      )
    end
  end
end
