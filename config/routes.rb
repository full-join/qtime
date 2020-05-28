Rails.application.routes.draw do
  root to: 'home#index'
  get 'home', to: 'home#index'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts
  get 'profile', to: 'users#show'
  resources :users do
    resources :likes
  end
  get 'login', to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :sessions
  get 'about', to: 'about#about'
end
