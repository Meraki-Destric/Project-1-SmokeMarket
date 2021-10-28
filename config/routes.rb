Rails.application.routes.draw do
  # Directs devise to use the registration controller
  devise_for :users, :controllers => { registrations: "registrations" }
  resources :posts
  root "pages#index"
  get "posts/"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
