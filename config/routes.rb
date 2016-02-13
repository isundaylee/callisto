Rails.application.routes.draw do
  devise_for :users

  root 'pages#homepage'

  resources :training

  get '/dashboard', to: 'pages#dashboard', as: 'dashboard'

  resources :robots, only: [:create, :destroy]
end
