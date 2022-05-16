Rails.application.routes.draw do
  root to: "articles#index"
  devise_for :users
  resources :users, only: :show
  resources :articles do
    resources :comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
    collection do
      get 'search'
    end
  end
end
