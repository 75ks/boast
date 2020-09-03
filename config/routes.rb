Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  root "posts#index"
  resources :posts, only: [:new, :create, :show, :destroy, :edit, :update] do
    resources :comments, only: :create
    resources :favorites, only: [:index, :create, :destroy]
    collection do
      get :search
    end
  end
  resources :users, only: [:index, :show, :destroy] do
    collection do
      get :likes
    end
  end
end
