# frozen_string_literal: true

Rails.application.routes.draw do
  root "home#index"
  get "home", to: "home#index"
  devise_for :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :lines, only: [:create]
  resources :places
  get "profile", to: "users#show"
  resources :users do
  end
  get "about", to: "about#about"
end
