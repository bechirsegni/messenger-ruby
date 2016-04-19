require 'rest-client'

module Messenger
  class MessengerController < ApplicationController
    def validate
      if valid_token? && bot_active?
        render json: params["hub.challenge"]
      elsif valid_token?
        render json: 'Invalid page access token'
      else
        render json: 'Invalid verify token'
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

    def bot_active?
      JSON.parse(activate_bot).key?('success')
    end

    def valid_token?
      params["hub.verify_token"] == Messenger.config.verify_token
    end
  end
end
