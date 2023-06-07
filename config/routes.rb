Rails.application.routes.draw do
  resources :orders, only: [:new, :create]
  
  resources :carts, except:[:index, :new, :edit]
  resources :cart_items, only:[:create, :update, :destroy]
  devise_for :users
  resources :items

  scope '/orders' do
    get 'success', to: 'orders#success', as: 'orders_success'
    get 'cancel', to: 'orders#cancel', as: 'orders_cancel'
  end

  root "items#index"

end
