Rails.application.routes.draw do

  resources :products, only: [:index]
  resources :carts, only: [:show]
  devise_for :users
  resources :order_items, only: [:create, :update, :destroy]

  get 'static/home'
  root "static#home"
end
