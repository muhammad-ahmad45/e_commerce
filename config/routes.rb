Rails.application.routes.draw do
  root to: 'users#index'
  
  # root to: "home#index" 

  devise_for :users, controllers: {
    session: 'users/sessions',
    registrations: 'users/registrations'
  }
  
  resources :users ,except: :show
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
