Rails.application.routes.draw do
  resources :products
  devise_for :users

  get 'static/home'
  root "static#home"

  resources :order_items, only: [:create, :update, :destroy]

  resources :order, only: [:create, :update]

  resource :cart, only: [:show, :update] do
    get :execute_paypal
    post :pay
    get :order_completed
    get :order_cancelled
  end

  namespace :admin do
    root to: 'admin#index'
    resources :products
    resources :users
    resources :orders
  end

  resources :static, only: [:index, :show] do
    collection do
      get :search
    end
  end

end
