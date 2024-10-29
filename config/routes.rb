Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  resources :posts, only: [:index, :show]
  resources :users, only: [:index, :show]
  resources :companies, only: [:index, :show] 
  
  resources :posts do
    resources :comments, only: [:show, :index, :create, :update]
  end
  resources :comments do
    resources :comments, only: [:show, :index, :create, :update]
  end
end
