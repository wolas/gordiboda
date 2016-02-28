Rails.application.routes.draw do
  get 'static/home'

  devise_for :users

  root "static#home"
end
