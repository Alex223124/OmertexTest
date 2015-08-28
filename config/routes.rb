Rails.application.routes.draw do
  
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root 'static_pages#index'
  resources :users
  resources :loans do
  	resources :payments
  end

  get '/payments', to: "payments#index"

  # Список всех платежей по конкретному кредиту пользователя (кастомный метод и роут для админа)
  get 'loans/:id/current_loan_payments', to: "loans#current_loan_payments"


  # Платежи конкретного юзера (кастомный метод для админа)
  #http://localhost:3000/users/1/payments

  # Кредиты конкретного юзера (кастомные метод для админа)
  #users/1/loans 

end
