Rails.application.routes.draw do
 
  root to: "pages#home"

  devise_for :users 
    resources :user_informations, only: [:show, :edit, :update]
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :tickets
end
