Rails.application.routes.draw do
  root to: 'posts#index'

  devise_for :users, controllers: { registrations: "registrations/registrations" }

  resources :posts, only: [:index]
  resources :comments, only: [:create, :destroy]

  resources :users, only: [:show] do
    resources :posts
  end

  get '/get_posts' => 'posts#get_posts'
end
