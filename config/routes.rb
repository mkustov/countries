require 'sidekiq/web'

Rails.application.routes.draw do
  devise_for :users
  mount Sidekiq::Web, at: '/sidekiq'
  root 'countries#index'
  resources :countries do
    post 'load_data', on: :collection
  end
  resources :trips
end
