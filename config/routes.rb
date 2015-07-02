Rails.application.routes.draw do
  root to: 'static_page#root'

  resource :session, only: [ :new, :create, :destroy ]
  resources :users, only: [ :index, :new, :create, :edit, :update ] do
    collection do
      get 'following', defaults: { format: :json }
      get 'followers', defaults: { format: :json }
    end
  end

  namespace :api, defaults: { format: :json } do
    resources :follows, only: [ :index, :create, :destroy ]
    resources :tweets, only: [ :index, :create, :destroy ]
  end
end
