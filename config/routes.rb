Rails.application.routes.draw do
  root "rooms#user_type"
  resources :owners
  resources :renters
  resources :rooms
end
