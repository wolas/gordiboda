Rails.application.routes.draw do

  devise_for :users


  get 'static/home'
  root "static#home"

  resources :products, only: [:index]
  resources :cart, only: [:show]
  resources :order_items, only: [:create, :update, :destroy]


end
