# frozen_string_literal: true

Rails.application.routes.draw do
  resources :recommends
  resources :seasons
  resources :season_viewings, path: 'season-watch-list'
  resources :shows
  get 'home/index'
  get 'home/privacy'
  get 'home/tmdb'
  get 'home/show'
  get 'home/season'
  resources :friendships
  get 'friends/create/:id', to: 'friendships#create', as: 'add_friend'
  resources :reviews
  resources :viewings, path: 'watch-list'
  devise_for :users
  resources :users, only: %i[index show edit update]

  root 'home#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
