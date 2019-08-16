Rails.application.routes.draw do
  resources :meeting_logs
  resources :tags, only:[:index, :create, :destroy]
end
