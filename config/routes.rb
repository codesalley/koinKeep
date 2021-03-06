Rails.application.routes.draw do
  devise_for :users
  resources :groups 
  resources :group_transactions
  resources :transactions
  get 'external_transactions', to: 'transactions#external'
  root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
