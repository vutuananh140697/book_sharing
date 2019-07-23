Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users, controllers: { registrations: :registrations }
  
  root "static_pages#show"
  
  resources :users, only: [:index, :show] do
    resources :reviews, except: :index
  end
  resources :books, only: [:index, :show] do
    resources :rates, only: [:create]
    resource :suggest_books, only: :create
  end
  resources :reviews do
    resources :comments
    resources :likes, only: [:create, :destroy]
  end
  resources :authors, only: [:index, :show]
  resources :categories, only: [:show]
  resources :comments
  get "users/:id/reviews" => "users#reviews", as: :user_all_reviews
  resources :relationships, only: [:create, :destroy]
  get "search", to: "static_pages#index", as: :search
  get "users/:id/followers", to: "users#followers", as: :user_followers
  get "users/:id/following", to: "users#following", as: :user_following
end
