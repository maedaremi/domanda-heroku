Rails.application.routes.draw do
  get 'questions/new'
  get 'sessions/new'
  
  root 'pages#index'
  get 'pages/help'
  
  resources :users
  resources :questions
  resources :categories
  resources :question_categories
  
  get    '/login',  to: 'sessions#new'
  post   '/login',  to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  root 'question#index'
end
