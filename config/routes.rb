Rails.application.routes.draw do
  get 'questions/new'
  get 'sessions/new'
  
  root 'pages#index'
  get 'pages/help'
  
  resources :users
  resources :questions
  resources :categories
  resources :answers
  
  get    '/login',  to: 'sessions#new'
  post   '/login',  to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  root 'question#index'
  
  get 'questions/:id' => 'questions#show'
  #get 'questions/:id' => 'answers#new'
end
