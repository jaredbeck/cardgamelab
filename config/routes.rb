Rails.application.routes.draw do
  root 'home#index'
  resources :cards, only: [:index]
  resources :users, only: [:index]
end
