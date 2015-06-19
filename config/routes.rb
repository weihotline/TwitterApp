Rails.application.routes.draw do
  root to: 'static_page#root'

  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :edit, :update]
end

