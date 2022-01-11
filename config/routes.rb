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

  get '/article/narrow_down_by_category', to: 'articles#narrow_down_by_category'
  get '/article/narrow_down_by_techcategory', to: 'articles#narrow_down_by_techcategory'

  root to: "users#new"
end
