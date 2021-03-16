Rails.application.routes.draw do
  resources :markers
  resources :users
  resources :likes
  get '/authenticate', to: 'sessions#authenticate'
  get 'auth/:provider/callback', to: 'users#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
