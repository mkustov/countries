require 'sidekiq/web'

Rails.application.routes.draw do
  devise_for :users
  mount Sidekiq::Web, at: '/sidekiq'
  root 'welcome#index'
  resources :currencies
  resources :countries do
    post 'load_data', on: :collection
    get 'trips', on: :collection
  end
  resources :trips
end
