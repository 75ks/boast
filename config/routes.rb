Rails.application.routes.draw do
  devise_for :users
  root "posts#index"
  resources :posts, only: [:new, :create, :show, :destroy, :edit, :update] do
    resources :comments, only: :create
    collection do
      get "search"
    end
  end
  resources :users, only: :show
end
