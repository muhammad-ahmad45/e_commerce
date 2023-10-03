Rails.application.routes.draw do

  root to: 'users#index'
  
  devise_for :users, controllers: {
    session: 'users/sessions',
    registrations: 'users/registrations'
  }
  
  resources :users do
    resources :roles
    resource :cart
    post '/carts/add_to_cart/:product_id', to: 'carts#add_to_cart', as: 'add_to_cart'
  end
  
  resources :products

end
