Rails.application.routes.draw do
  
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root 'static_pages#index'
  resources :users
  resources :loans do
  	resources :payments
  end
  
  
end
