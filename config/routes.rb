Rails.application.routes.draw do
  
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root 'static_pages#index'
  resources :users
  resources :loans do
  	resources :payments
  end

  get '/payments', to: "payments#index"

  #Платежи по конкретному кредиту пользователем (кастомный метод для админа)
  get '/users/:id/loans/:id/payments', to: "payments#loan_payments"

  # Платежи конкретного юзера (кастомный метод для админа)
  http://localhost:3000/users/1/payments

  # Кредиты конкретного юзера (кастомные метод для админа)
  users/1/loans 

end
