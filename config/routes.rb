Rails.application.routes.draw do
  root to: 'users#index'
  resources :users
  # root to: "home#index" 

  devise_for :users, controllers: {
    # session: 'users/sessions',
    registrations: 'users/registrations'
  }

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
