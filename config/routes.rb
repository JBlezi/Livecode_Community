Rails.application.routes.draw do
  get 'tickets/index'
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :tickets

  get "pages", to: "pages#show"
  
end
