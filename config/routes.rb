Messenger::Engine.routes.draw do
  get :messenger_webhook, to:  "messenger#webhook"
end
