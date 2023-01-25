Rails.application.routes.draw do
#  root "api/v1/greets#index"
 get 'authenticate/user_login', to: 'authenticates#user_login'
 namespace :api do
  namespace :v1 do
    get "greets", to: 'greets#index'
    post "greets", to: 'greets#create'
    get "users", to: 'users#index'
    post "users", to: 'users#create'
  end
 end
end
