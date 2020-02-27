Rails.application.routes.draw do
  devise_for :users
  root to: 'recipes#index'

  # post '/recipes/:id', to: 'calculations#create'
  resources :users, only: :show
  resources :recipes, expect: :index do
    resources :likes, only: [:create, :destroy]
    # resources :calculations
  end
end
