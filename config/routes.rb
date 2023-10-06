Rails.application.routes.draw do

  root to: 'users#index'
  
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    confirmations: 'users/confirmations', 
    session: 'users/sessions'
  }
  
  resources :users do
    resources :roles
    resource :cart, except: [:edit]
    post '/carts/add_to_cart/:product_id', to: 'carts#add_to_cart', as: 'add_to_cart'
    get '/carts/edit/:line_item_id', to: 'line_items#edit', as: 'edit_line_item'
  end
  
  resources :products
  resources :line_items, only: [:update, :edit, :destroy] 
  patch 'line_items/:id/update_quantity', to: 'line_items#update_quantity', as: :update_quantity_line_item


end
