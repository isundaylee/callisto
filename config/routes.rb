require 'resque/server'

Rails.application.routes.draw do
  mount Resque::Server.new, at: "/resque"

  get 'trainings/train'

  get 'fights/show'

  devise_for :users

  root 'pages#homepage'

  get '/dashboard', to: 'pages#dashboard', as: 'dashboard'

  resources :training
  resources :robots, only: [:create, :destroy]
  resources :skills, only: [] do
    member do
      post :activate
      post :deactivate
      get :invoke

      get 'train/:name', to: 'trainings#train', as: 'train'
      post 'train/:name', to: 'trainings#submit', as: 'submit_training'
    end
  end
  resources :fights, only: [:create, :show]
end
