Rails.application.routes.draw do
  get 'dashboard', to: 'users#dashboard'
  devise_for :users
  root to: 'pages#home'

  resources :vacuums do
    resources :bookings
  end
end
