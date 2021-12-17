Rails.application.routes.draw do
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :users do
    resource :mypages, only: :show
  end
  resources :articles do
    resources :comments, only: [:create, :edit, :destroy]
    resource :stamps, only: [:create, :destroy]
    resource :bookmarks, only: [:create, :destroy]
  end

  get '/article/search', to: 'articles#search'

  root to: "users#new"
end
