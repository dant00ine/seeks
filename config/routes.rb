Rails.application.routes.draw do
  get 'secrets/index'

  get 'secrets/new'

  get 'secrets/show'

  get 'secrets/create'

  get 'secrets/delete'

  root 'sessions#new'
  get 'sessions/new', to: 'sessions#new'
  # get '/login', to: "sessions#new"
  get '/users/new', to: 'users#new'
  get '/users/:id', to: "users#show"
  get 'users/edit/:id', to: 'users#edit'

  post 'sessions/create', to: 'sessions#create'
  post '/users/create', to: 'users#create'
  patch '/users/:id', to: 'users#update'
  delete '/users/:id', to: 'users#destroy'
  delete '/sessions', to: 'sessions#destroy'

  post '/likes', to: 'likes#create'
  delete '/likes', to: 'likes#destroy'

  resources :secrets

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
