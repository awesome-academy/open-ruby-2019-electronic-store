Rails.application.routes.draw do
  root "products#home"

  get "/home", to: "products#home"
end
