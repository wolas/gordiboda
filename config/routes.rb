Rails.application.routes.draw do

  resources :lists, only: [:index]
  resources :carts, only: [:show]
  devise_for :users

  get 'static/home'
  root "static#home"
end
