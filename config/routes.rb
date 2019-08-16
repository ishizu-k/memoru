Rails.application.routes.draw do
  devise_for :users
  root to: 'meeting_logs#index' #暫定的なroot
  resources :meeting_logs
  resources :tags, only:[:index, :create, :destroy]
end
