Rails.application.routes.draw do
  resources :comments
  root to: 'posts#index'

  devise_for :users

  resources :posts, only: [:index]
  resources :users do
    resources :posts
  end

  get '/get_posts' => 'posts#get_posts'
end
