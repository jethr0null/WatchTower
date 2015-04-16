Rails.application.routes.draw do
  resources :accounts
  resources :users
  resources :customers

  root                    'sessions#new'
  get    'add_account' => 'accounts#new'
  get    'signup'      => 'users#new'
  get    'login'       => 'sessions#new'
  post   'login'       => 'sessions#create'
  delete 'logout'      => 'sessions#destroy'
  get    'dashboard'   => 'static_pages#dashboard'
  get    'list_accounts' => 'customers#list_accounts'
  # Will do this correctly (add logic to main dash) later
  #TODO Fix format -> id in route
  get    'customer_dashboard'   => 'customers#dashboard'
end
