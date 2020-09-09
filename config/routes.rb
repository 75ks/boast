Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  root "posts#index"
  resources :posts, only: [:new, :create, :show, :destroy, :edit, :update] do
    resources :comments, only: [:create, :destroy]
    resources :favorites, only: [:index, :create, :destroy]
    collection do
      get :search
    end
  end
  resources :users, only: [:show, :destroy] do
    collection do
      get :likes
    end
  end
end
