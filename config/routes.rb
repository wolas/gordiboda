Rails.application.routes.draw do

  devise_for :users


  get 'static/home'
  root "static#home"

  resources :products, only: [:index]
  resources :carts
  resources :order_items, only: [:create, :update, :destroy]

end
