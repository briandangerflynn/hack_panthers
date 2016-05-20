Rails.application.routes.draw do
  resources :owners
  resources :renters
  resources :rooms
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/signup' => 'renters#new'
  post '/signup' => 'renters#create'
end
