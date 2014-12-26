Rails.application.routes.draw do
  devise_for :users

  resources :listings, only: [:index]
end
