Rails.application.routes.draw do


  root "rooms#user_type"

  get '/ownerlogin' => 'sessions#newowner'
  post '/ownerlogin' => 'sessions#createowner'
  get '/ownerlogout' => 'sessions#destroyowner'
  get '/renterlogin' => 'sessions#newrenter'
  post '/renterlogin' => 'sessions#createrenter'
  get '/renterlogout' => 'sessions#destroyrenter'

  get '/owners/signup' => 'owners#new'
  post '/owners/signup' => 'owners#create'

  get '/renters/signup' => 'renters#new'
  post '/renters/signup' => 'renters#create'
  resources :owners
  resources :rooms
  resources :renters






end
