Rails.application.routes.draw do

  mount_devise_token_auth_for 'User', at: 'auth'
  # Defina suas rotas personalizadas depois
  resources :posts, only: [:index, :show]
  resources :comments, only: [:index, :show]
  resources :users, only: [:index, :show]
  resources :companies, only: [:index, :show] 
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
end
