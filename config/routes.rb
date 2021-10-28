Rails.application.routes.draw do
<<<<<<< HEAD
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
=======
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
>>>>>>> parent of 01cc2cd (Games Controller)
end
