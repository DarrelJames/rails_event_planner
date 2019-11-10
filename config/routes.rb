Rails.application.routes.draw do
  devise_for :users

  root 'static#index'
  resources :guests
  resources :events
  resources :venues
end
