Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  root "posts#index"
  resources :posts, only: [:new, :create, :show, :destroy, :edit, :update] do
    resources :comments, only: :create
    resources :favorites, only: [:show, :create, :destroy]
    collection do
      get "search"
    end
  end
  resources :users, only: [:show, :destroy]
end
