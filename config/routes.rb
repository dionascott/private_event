Rails.application.routes.draw do
  get 'events/new'

  root to: "users#new"
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :events, only: [:new, :create, :show, :index, :update]
  resources :users,  only: [:new, :create, :show]
end
