Rails.application.routes.draw do

  root 'home#index'

  devise_for :users
  resources :users do
    member do
      get :following, :followers
    end
  end
  match '/users/:id', to: 'users#show', via: 'get'
  get 'search', to: 'users#search' #sets up route so search bar can be used to find users

  resources :posts do
    resources :comments
    resources :likes
  end

  resource :follows, only: [:create, :destroy]

end
