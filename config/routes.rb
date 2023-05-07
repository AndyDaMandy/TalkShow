Rails.application.routes.draw do
  resources :seasons
  resources :season_viewings, path: 'season-watch-list'
  resources :shows
  get 'home/index'
  get 'home/privacy'
  get 'home/tmdb'
  resources :friendships
  resources :reviews
  resources :viewings, path: 'watch-list'
  devise_for :users
  resources :users, only: %i[index show edit update]

  root 'shows#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
