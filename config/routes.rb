Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

  namespace :api do
    devise_for :users, controllers: { 
      sessions: 'devise/sessions', 
      registrations: 'devise/registrations' }
    resources :expenses
    resources :incomes
    resources :categories
    resources :budgets
  end

end
