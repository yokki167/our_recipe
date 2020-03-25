Rails.application.routes.draw do
  devise_for :users
  root to: 'recipes#index'
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  resources :users, only: :show
  resources :recipes, expect: :index do
    resources :likes, only: [:create, :destroy]
    collection do
      get 'search'
    end
    member do
      get 'category'
    end
  end
end
