Rails.application.routes.draw do
  resources :owners
  resources :rooms
  resources :renters

  namespace :renters do
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/signup' => 'renters#new'
  post '/signup' => 'renters#create'
end
end
