Rails.application.routes.draw do

  root to: 'users#index'
  
  devise_for :users, controllers: {
    session: 'users/sessions',
    registrations: 'users/registrations'
  }
  
  resources :users do
    resources :roles
    resource :cart
  end

  resources :products

end
