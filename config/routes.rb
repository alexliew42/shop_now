Rails.application.routes.draw do
  resources :products
  resources :users
  post "/sessions" => "sessions#create"
  post "/cartedproducts" => "cartedproducts#create"
  get "/cartedproducts" => "cartedproducts#index"
  resources :orders
end
