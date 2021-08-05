Rails.application.routes.draw do
  devise_for :users
  devise_for :books
  root to: 'homes#top'
end
