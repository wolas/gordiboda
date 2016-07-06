Rails.application.routes.draw do

  devise_for :users


  get 'static/home'
  root "static#home"

  resources :products, only: [:index]

  resources :order_items, only: [:create, :update, :destroy]

  resources :order, only: [:create, :update]

  resource :cart, only: [:show, :update] do
    post :pay
    get :order_complete
  end

end
