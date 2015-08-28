Rails.application.routes.draw do
  
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root 'static_pages#index'
  resources :users
  resources :loans do
  	resources :payments
  end

  get '/payments', to: "payments#index"
  get 'loans/:id/payments/new', to: 'payments#new'

  # Список всех платежей по конкретному кредиту пользователя (кастомный метод и роут для админа)
  get 'loans/:id/current_loan_payments', to: "loans#current_loan_payments"

  # Администратор может просматривать все кредиты выбранного пользователя в виде списка
  get 'users/:id/current_user_loans', to: "users#current_user_loans"


  get '/take_loans', to: "static_pages#take_loans"
  get '/make_payments', to: "static_pages#make_payments"
  get '/be_superhero', to: "static_pages#be_superhero"
  
end
