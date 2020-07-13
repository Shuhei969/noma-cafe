Rails.application.routes.draw do
  devise_for :users
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

  resource :profile
end