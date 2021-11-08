Rails.application.routes.draw do


  get 'friends/index'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  devise_scope :user do

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
    
    authenticated do
      resources :posts
      root "posts#index", as: :authenticated_root
    end
    
  end

  resources :users, only: [:show]

  resources :friends, only: [:create, :destroy, :update]

end
