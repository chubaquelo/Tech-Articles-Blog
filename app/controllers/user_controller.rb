class UserController < ActionController::Base
  resources :users, only: [:show]


end
