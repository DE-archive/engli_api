Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do

      # mount_devise_token_auth_for 'User', at: 'auth'
      # mount LikeDislike::Engine, at: '/'

      # devise_for :users

      # mount_devise_token_auth_for 'User', at: 'auth'
      # get '/auth/:provider/callback', to: 'sessions#create'

      root to: 'api/application#angular'
      # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
      resources :users, to: 'api/users#'
      resources :notification
      post '/create_notifi', to: 'notification#create'
      post '/error_notifi', to: 'notification#error'
      root 'welcome#index'

      post '/users/:id', to: 'api/users#show'
      get '/phrases/categories', to: 'api/categories#index'
      get '/phrases/categories/:id', to: 'api/categories#show'

      resources :phrases, to: 'api/phrases#'
      resources :examples, to: 'api/examples#'
      get '/', to: 'api/application#angular'
      match '/*path', to: 'api/application#angular', via: [:get, :post, :put, :patch, :delete]


    end
  end

end
