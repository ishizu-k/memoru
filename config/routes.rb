Rails.application.routes.draw do
  root to: 'users#show' #暫定的なroot
  devise_for :users
  resources :meeting_logs do
    resources :comments
  end
  resources :tags, only:[:index, :create, :destroy]
  resources :users, only: [:show]
end
