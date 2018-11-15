Rails.application.routes.draw do
  resources :comments, only: [:create, :destroy]
  resources :posts
  resources :users
  resources :likes, only: [:create, :destroy]
  resources :lists, only: [:index, :create, :destroy]
  resources :follows, only: [:create, :destroy]

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/search', to: 'search#search'
  get "*path", to: 'application#redirect_bad_route'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
