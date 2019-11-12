Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root 'static#index'
  resources :guests
  resources :events
  resources :venues
  resources :rsvps
end
