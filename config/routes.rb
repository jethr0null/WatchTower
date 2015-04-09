Rails.application.routes.draw do
  resources :accounts
  resources :users

  root                    'sessions#new'
  get    'add_account' => 'accounts#new'
  get    'signup'      => 'users#new'
  get    'login'       => 'sessions#new'
  post   'login'       => 'sessions#create'
  delete 'logout'      => 'sessions#destroy'
  get    'dashboard'   => 'static_pages#dashboard'
end
