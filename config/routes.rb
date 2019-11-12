Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root 'static#index'
  resources :guests
  resources :events do
    resources :rsvps
  end
  resources :venues

end
