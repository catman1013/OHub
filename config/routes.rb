Rails.application.routes.draw do
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :users

  resources :articles do
    resources :comments, only: [:create, :edit, :destroy]
    resource :stamps, only: [:create, :destroy]
    resource :bookmarks, only: [:create, :destroy]
  end

  root to: "users#new"

  resources :relationships, only: [:create, :destroy]
end
