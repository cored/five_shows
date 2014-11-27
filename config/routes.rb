Rails.application.routes.draw do
  root to: 'concerts#new'

  resources :concerts, only: [:create, :index]
end
