Rails.application.routes.draw do
  resources :comments, only: [:create, :destroy]
  resources :posts
  resources :users, only: [:index, :new, :create, :show]
  resources :likes, only: [:create, :destroy]
  resources :saves, only: [:create, :destroy]

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
