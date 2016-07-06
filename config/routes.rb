Rails.application.routes.draw do

  devise_for :users


  get 'static/home'
  root "static#home"

  resources :products, only: [:index]
  resource :cart
  resources :order_items, only: [:create, :update, :destroy]
  resources :order, only: [:create, :update]

end
