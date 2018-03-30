Rails.application.routes.draw do
  root 'home#show'

  devise_for :users

  resources :users, only: [:show] do
    resources :items, only: [:create]
  end

  delete 'items/:id', to: 'items#delete', as: 'item'
end
