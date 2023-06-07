Rails.application.routes.draw do
  get 'cart_items/create'
  get 'cart_items/update'
  get 'cart_items/destroy'
  get 'carts/show'
  get 'carts/create'
  get 'carts/update'
  get 'carts/destroy'
  devise_for :users
  resources :items
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: "items#index"
end
