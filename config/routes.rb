Rails.application.routes.draw do
  
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  root 'posts#index'
  resources :posts, only: %i[index show]
  get '/about', to: 'pages#about'

  namespace :api, { format: 'json' } do
    resources :likes, only: [:index, :create]
  end

  namespace :api do
    get 'likes/index'
    get 'likes/create'
  end

  namespace :admin do
    root 'posts#index'
    resources :posts, only: %i[index show new create edit update destroy]
  end

end
