Rails.application.routes.draw do
  get 'questions/new'
  get 'sessions/new'
  
  root 'pages#index'
  get 'pages/help'
  
  resources :users do
    member do
      get :following,:followers
    end
  end
  resources :questions
  resources :categories
  resources :answers
  resources :relationships
  #, only: [:create, :destroy]
  
  get    'favorites/index'
  post   '/favorites', to: 'favorites#create'
  delete '/favorites', to: 'favorites#destroy'
  
  get    '/login',  to: 'sessions#new'
  post   '/login',  to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  root 'question#index'
  
end
