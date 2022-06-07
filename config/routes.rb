Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  devise_for :users, :controllers => {:registrations => "users/registrations"}

    resources :user_informations, only: [:show, :edit, :update]
    resources :messages, only: :index

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :tickets do
    resources :reviews, except: [:destroy]
  end
  resources :reviews, only: [:destroy, :edit, :update]
  
  resources :chats, only: [:show, :create] do
    resources :messages, only: :create
  end
  
  root to: "pages#home"
end
