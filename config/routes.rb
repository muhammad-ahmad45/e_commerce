Rails.application.routes.draw do

  root to: 'products#index'
  
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    confirmations: 'users/confirmations', 
    session: 'users/sessions'
  }
  
  resources :products

  resources :users do
    resources :roles
    resource :cart, except: [:edit]
    post '/carts/add_to_cart/:product_id', to: 'carts#add_to_cart', as: 'add_to_cart'
    patch 'line_items/:id/update_quantity', to: 'line_items#update_quantity', as: :update_quantity_line_item

  end

  # get 'carts/:cart_id/orders/new', to: 'orders#new'
  # get 'carts/:cart_id/orders/edit', to: 'orders#edit'
  # get 'carts/:cart_id/orders/show', to: 'orders#show'
  
  resources :line_items, only: [:update, :edit, :destroy] 
  resources :orders

end
