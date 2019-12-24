Rails.application.routes.draw do
  root "products#home"

  get "/home", to: "products#home"
  get "/signup", to: "users#new"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  resources :users
end
