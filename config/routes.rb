Rails.application.routes.draw do
  root 'home#index'
  resources :cards, only: [:create, :index, :new]
  resources :sessions, only: [:create, :destroy, :new]
  resources :users, only: [:index, :show]
end
