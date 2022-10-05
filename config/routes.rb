Rails.application.routes.draw do

  get "/home", to: "masks#index"

  resources :masks
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
Rails.application.routes.draw do
  resources :users
  # get "/masks", to: "masks#index"
  get "/login", to: "users#login"
  get "/logout", to: "users#logout"
  post "/login" , to: "users#check_login"
  get "/users/register/:role", to: "users#register"
  # post "/users/:role", to: "users#create"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
  # get "/masks/login", to: "masks#login"
  # get "/masks/register-general", to: "masks#register-general"
  # get "/masks/register-officer", to: "masks#register-officer"

 # get "/register/:role", to: "users#register_general"