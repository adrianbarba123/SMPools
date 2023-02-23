Rails.application.routes.draw do
  
  resources :pool_services
  resources :services
  resources :pools
  resources :users, except: [:create, :show]

  post "/login", to: "sessions#login"
  post "/signup", to: "users#create"
  delete "/logout", to: "sessions#logout"
  get "/me", to: "users#show"
  
  
  
  
  # Routing logic: fallback requests for React Router.
  # Leave this here to help deploy your app later!
  get "*path", to: "fallback#index", constraints: ->(req) { !req.xhr? && req.format.html? }
end
