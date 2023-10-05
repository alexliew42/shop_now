Rails.application.routes.draw do
  resources :products
  resources :users
  post "/sessions" => "sessions#create"
  resources :cartedproduct
end
