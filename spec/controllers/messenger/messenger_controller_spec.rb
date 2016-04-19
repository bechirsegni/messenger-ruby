require "spec_helper"

module Messenger
  describe MessengerController, type: :controller do
    routes { Messenger::Engine.routes }
  end
end
