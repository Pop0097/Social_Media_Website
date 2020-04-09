Rails.application.routes.draw do

  root 'home#index'

  devise_for :users
  resources :users
  match '/users/:id', to: 'users#show', via: 'get'


  resources :posts do
    resources :comments
  end

end
