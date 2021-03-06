Rails.application.routes.draw do
  root to: 'articles#index'
  devise_for :users, :controllers => { :omniauth_callbacks => 'users/omniauth_callbacks' }
  resources :articles, only: [:show, :index, :new, :create]
  resources :categories, only: [:show, :index]
  resources :votes, only: [:create, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
