Rails.application.routes.draw do
  root 'welcome#index'
  resources :currencies
  resources :countries
end
