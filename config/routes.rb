Rails.application.routes.draw do
  root                'sessions#new'
  get    'signup'  => 'users#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  get    'dashboard'=> 'static_pages#dashboard'
  resources :users
end
