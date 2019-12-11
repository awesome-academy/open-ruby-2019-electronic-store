Rails.application.routes.draw do
  root "products#home"

  get "/home", to: "products#home"
  get "/signup", to: "users#new"

  resources :users
end
