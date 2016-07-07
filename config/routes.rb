Rails.application.routes.draw do
  resources :products
  devise_for :users

  get 'static/home'
  root "static#home"

  resources :products, only: [:index]

  resources :order_items, only: [:create, :update, :destroy]

  resources :order, only: [:create, :update]

  resource :cart, only: [:show, :update] do
    get :execute_paypal
    post :pay
    get :order_complete
    get :order_cancelled
  end

  namespace :admin do
    root to: 'admin#index'
    resources :products
  end

end
