Rails.application.routes.draw do
  get 'home/index'
  get 'home/privacy'
  get 'home/tmdb'
  get 'homepage/index'
  get 'homepage/privacy'
  get 'homepage/tmdb'
  resources :friendships
  resources :reviews
  resources :viewings
  devise_for :users

  root "viewings#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
