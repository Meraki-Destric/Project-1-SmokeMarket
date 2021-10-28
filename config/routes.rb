require "sidekiq/web"

Rails.application.routes.draw do
  devise_for :users
  resources :library, only[:index]
  resources :games
  root "games#index"
end
