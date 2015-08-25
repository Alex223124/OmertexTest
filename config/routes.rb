Rails.application.routes.draw do
  
  devise_for :users
  root 'static_pages#index'
  resources :users
  resources :loans
  resources :payments 
  
end
