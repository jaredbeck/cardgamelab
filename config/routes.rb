Rails.application.routes.draw do
  root 'home#index'
  resources :cards, only: [:index]
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:index]
end
