class UsersController < ApplicationController
  resources :users, only: [:show]
end
