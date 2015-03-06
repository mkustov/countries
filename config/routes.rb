Rails.application.routes.draw do
  root 'welcome#index'
  resources :currencies
  resources :countries do
    post 'load_data', on: :collection
    get 'trips', on: :collection
  end
  resources :trips
end
