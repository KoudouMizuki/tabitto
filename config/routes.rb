Rails.application.routes.draw do

  devise_for :users,skip: [:password], controllers: {
    registrations: "public/registrations",
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
    resources :users, only: [:show, :edit, :update]
  end  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
