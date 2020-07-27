Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users#new_guest'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'articles#index'
  resources :articles do
    resources :comments, only: [:new, :index, :create]
    resource :like, only: [ :create, :destroy, :show ]
    collection do
      get :search
      post :upload_eyecatch
    end
  end

  resources :favorites, only: [:index]
  resources :acounts, only: [:show] do
    resources :follows, only: [:create]
    resources :unfollows, only: [:create]
  end
  resource :profile
end