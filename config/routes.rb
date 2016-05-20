Rails.application.routes.draw do


  root "rooms#user_type"
  get '/owners/signup' => 'owners#new'
  post '/owners/signup' => 'owners#create'

  get '/renters/signup' => 'renters#new'
  post '/renters/signup' => 'renters#create'
  resources :owners
  resources :rooms
  resources :renters


  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'



end
