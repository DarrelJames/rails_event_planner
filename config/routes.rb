Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root 'static#index'
  resources :guests
  resources :events do
    resources :rsvps, only: [:update, :index, :create]
    resources :guests, shallow: true
  end
  resources :venues, only: [:show]

end
