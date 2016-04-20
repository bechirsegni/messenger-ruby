Messenger::Engine.routes.draw do
  get  :subscribe, to: "messenger#subscribe"
  get  :webhook,   to: "messenger#validate"
  post :webhook,   to: "messenger#webhook"
end
