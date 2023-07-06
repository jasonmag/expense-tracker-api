Rails.application.routes.draw do
  resources :account_types
  resources :accounts
  resources :transaction_types
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

  namespace :api do
    
    
  end

  scope 'api' do 
    devise_for :users, controllers: { 
      sessions: 'users/sessions',
      registrations: 'users/registrations' }

    get '/member-data', to: 'members#show'
    
    resources :expenses
    resources :incomes
    resources :categories
    resources :budgets
  end

end
