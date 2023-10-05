Rails.application.routes.draw do

  root to: 'users#index'
  
  devise_for :users, controllers: {
    session: 'users/sessions',
    registrations: 'users/registrations'
  }
  
  resources :users do
    resources :roles
    resource :cart, except: [:edit]
    post '/carts/add_to_cart/:product_id', to: 'carts#add_to_cart', as: 'add_to_cart'
    get '/carts/edit/:line_item_id', to: 'line_items#edit', as: 'edit_line_item'
  end
  
  resources :products
  resources :line_items, only: [:update, :edit, :destroy] do
    member do
      patch 'update_quantity'
    end
  end

end
