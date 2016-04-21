Messenger::Engine.routes.draw do
  get  :subscribe, to: "messenger#subscribe"
  get  :webhook,   to: "messenger#validate"
end

Rails.application.routes.draw do
  post 'messenger/webhook', to: "messenger#webhook"
end
