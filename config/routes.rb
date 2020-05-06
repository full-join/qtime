Rails.application.routes.draw do
  root 'home#index'
  get 'home', to: 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts
  get 'profile', to: 'users#show'
  resources :users do
  end
  get 'login', to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :sessions
  get 'about', to: 'about#about'
end
