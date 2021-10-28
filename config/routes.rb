require "sidekiq/web"

Rails.application.routes.draw do
  # The registrations controller will redirect the user after they signup
  devise_for :users, controller: { registrations: "registrations" }
  resources :library, only[:index]
  resources :games do
    # Create funtionality for the user to add and remove books from the library as they please
    member do
      put "add", to: "games#library"
      put "remove", from: "games#library"
    end
  end

  root "games#index"
end
