Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  devise_for :users, controllers: { sessions: 'api/sessions', registrations: 'api/registrations' }

  namespace :api do

    resources :registrations, only: [:create]
    resources :expenses
    resources :incomes
    resources :categories
    resources :budgets
  end

end
