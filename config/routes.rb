Rails.application.routes.draw do
  get 'home/index'
  get 'home/privacy'
  get 'home/tmdb'
  resources :friendships
  resources :reviews
  resources :viewings
  devise_for :users
  resources :users, only: %i[ index show edit update ]

  root "home#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
