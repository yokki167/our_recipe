Rails.application.routes.draw do
  devise_for :users
  root to: 'recipes#index'
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  # post '/recipes/:id', to: 'calculations#create'
  resources :users, only: :show
  resources :recipes, expect: :index do
    resources :likes, only: [:create, :destroy]
    # resources :calculations
  end
end
