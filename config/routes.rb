Rails.application.routes.draw do

  get 'comments/create'
  get 'friends/index'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  devise_scope :user do

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
    
    authenticated do
      resources :posts do
        resources :comments
      end
      get '/post/:id/like', to: 'posts#like', as: 'like_post'
      root "posts#index", as: :authenticated_root

      get '/post/:post_id/comments/:id/like', to: 'comments#like', as: 'like_comment'

    end
    
  end

  resources :users, only: [:show]
  resources :friends, only: [:create, :destroy, :update]

end
