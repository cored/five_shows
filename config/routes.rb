Rails.application.routes.draw do
  root to: 'concerts#new'

  resources :concerts, only: [:index]
end
