Rails.application.routes.draw do
  root to: 'meeting_logs#index' #暫定的なroot
  resources :meeting_logs
  resources :tags, only:[:index, :create, :destroy]
end
