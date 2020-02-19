Rails.application.routes.draw do
  devise_for :users
  root to: 'recipes#index'
  resources :users, only: :show
  resources :recipes, expect: :index do
    resources :likes, only: [:create, :destroy]
  end
end
