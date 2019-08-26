Rails.application.routes.draw do
  root to: 'users#index'
  devise_for :users
  resources :meeting_logs do
    patch :toggle_status
    resources :comments
    collection do
      get 'name_only'
      get 'image_only'
    end
  end
  resources :tags, only:[:index, :create, :destroy]
  resources :users, only: [:show, :index]
end
