Rails.application.routes.draw do
  root "rooms#user_type"
  resources :owners
  resources :renters
  resources :rooms

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/owners/signup' => 'owners#new'
  post '/owners/signup' => 'owners#create'

  get '/renters/signup' => 'renters#new'
  post '/renters/signup' => 'renters#create'
