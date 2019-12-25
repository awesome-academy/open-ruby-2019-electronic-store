Rails.application.routes.draw do
  root "products#index"

  get "/home", to: "products#index"
  get "/signup", to: "users#new"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  resources :users
  resources :products, only: %i(index)
end
