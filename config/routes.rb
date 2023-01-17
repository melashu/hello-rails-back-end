Rails.application.routes.draw do
 namespace :api do
  namespace :v1 do
    get "greets", to: 'greets#index'
  end
 end
end
