Messenger::Engine.routes.draw do
  get :webhook, to:  "messenger#validate"
  post :webhook, to: "messenger#webhook"
end
