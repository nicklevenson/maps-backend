Rails.application.routes.draw do
  post '/likes/goodbye', to: 'likes#goodbye'
  resources :markers
  resources :users
  resources :likes, only: :create
  
  get '/authenticate', to: 'sessions#authenticate'
  get 'auth/:provider/callback', to: 'users#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
