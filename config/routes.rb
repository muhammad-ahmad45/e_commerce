Rails.application.routes.draw do

  root to: 'users#index'
  

  devise_for :users, controllers: {
    session: 'users/sessions',
    registrations: 'users/registrations'
  }
  
  resources :users do
    resources :roles
    end

  resources :products
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
