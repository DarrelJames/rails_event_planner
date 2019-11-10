Rails.application.routes.draw do
  get 'events/new'
  get 'events/show'
  get 'events/index'
  devise_for :users

  root 'static#index'
  resources :guests
  resources :events
  resources :venues
end
