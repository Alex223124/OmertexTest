Rails.application.routes.draw do
  
  devise_for :users
  root 'static_pages#root'
  resources :users
  resources :loans
  resources :payments 
  
end
