Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  root to: 'recipes#index'
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  resources :users, only: :show
  resources :recipes, expect: :index do
    resources :likes, only: [:create, :destroy]
    collection do
      get 'simplesearch'
      get 'detail_search'
    end
    member do
      get 'category'
    end
  end
end
