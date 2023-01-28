Rails.application.routes.draw do

  namespace :admin do
    get 'comments/index'
  end
  devise_for :users, controllers: {
    registrations: "public/registrations",
    passwords: 'users/password',
    sessions: 'public/sessions'
  }
  devise_for :admin,skip: [:registrations, :password], controllers: {
    sessions: "admin/sessions"
  }

  devise_scope :user do
    post 'users/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end

  scope module: :public do
    root to: "homes#top"
    get 'homes/about' => 'homes#about', as: 'about'
    get 'searches' => 'posts#search'
    get 'users/mypage/:id' => 'users#show', as: 'users_mypage'
    get 'users/mypage/:id/edit' => 'users#edit', as: 'users_mypage_edit'
    patch 'users/mypage/:id' => 'users#update', as: 'users_mypage_update'
    resources :posts, only: [:new, :create, :show, :edit, :update, :destroy]
    resources :favorites, only: [:index]
    resources :posts do
      resource :favorites, only: [:create, :destroy]
    end
    resources :posts do
      resources :comments, only: [:create, :destroy]
    end
  end

  namespace :admin do
    resources :users, only: [:index, :show, :edit, :update]
    resources :comments, only: [:index, :destroy]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
