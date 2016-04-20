require 'rest-client'

module Messenger
  class MessengerController < ActionController::Base
    def validate
      if valid_token? && bot_active?
        render json: params["hub.challenge"]
      elsif valid_token?
        render json: 'Invalid page access token'
      else
        render json: 'Invalid verify token'
      end
    end

    def subscribe
      render json: activate_bot
    rescue RestClient::BadRequest
      render json: 'Invalid page access token'
    end

    private

    def app_location
      "https://graph.facebook.com/v2.6/me/subscribed_apps?access_token=#{Messenger.config.page_access_token}"
    end

    def activate_bot
      RestClient.post(app_location, nil)
    end

    def page_published?
      JSON.parse(RestClient.get(app_location))['data'].any?
    rescue RestClient::BadRequest
      return false
    end

    def bot_active?
      page_published? || activate_bot
    end

    def valid_token?
      params["hub.verify_token"] == Messenger.config.verify_token
    end
  end
end
