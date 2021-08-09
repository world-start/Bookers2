Rails.application.routes.draw do
  devise_for :users
  devise_for :books
  root to: 'homes#top'
  get "home/about" => "homes#about"
  resources :post_images, only: [:new, :create, :index, :show, :destroy, :edit]
  resources :users, only: [:show]
end
