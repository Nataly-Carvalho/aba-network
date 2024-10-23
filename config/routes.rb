Rails.application.routes.draw do
  resources :posts, only: [:index, :show]
  resources :companies, only: [:index, :show] 
  mount_devise_token_auth_for 'User', at: 'auth'
  
  resources :posts do
    resources :comments, only: [:show, :index, :create, :update]
  end
  resources :comments do
    resources :comments, only: [:show, :index, :create, :update]
  end
end
