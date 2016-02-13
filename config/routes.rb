Rails.application.routes.draw do
  devise_for :users

  root 'pages#homepage'

  get '/dashboard', to: 'pages#dashboard', as: 'dashboard'

  resources :training
  resources :robots, only: [:create, :destroy]
  resources :skills, only: [] do
    member do
      post :activate
      post :deactivate
    end
  end
end
