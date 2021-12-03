Rails.application.routes.draw do
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :users
  resources :articles do
    resources :comments, only: [:create, :edit, :destroy]
  end

  root to: "users#new"
end
