Rails.application.routes.draw do
  root to: 'meeting_logs#index' #暫定的なroot
  devise_for :users
  resources :meeting_logs
  resources :tags, only:[:index, :create, :destroy]
  resources :users, only: [:show]
end
