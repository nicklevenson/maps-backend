Rails.application.routes.draw do
  resources :maps
  post '/likes/goodbye', to: 'likes#goodbye'
  post '/addToMap', to: 'markers#addToMap'
  post '/removeFromMap', to: 'markers#removeFromMap'
  resources :markers
  resources :users
  resources :likes, only: :create

  get '/authenticate', to: 'sessions#authenticate'
  get '/authenticate-facebook', to: 'sessions#authenticate_facebook'
  get 'auth/:provider/callback', to: 'users#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
