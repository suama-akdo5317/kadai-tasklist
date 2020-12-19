Rails.application.routes.draw do
  root to: 'tasks#index'

=begin
  get 'users/index'
  get 'users/show'
  get 'users/new'
  get 'users/create'
=end
  
  resources :tasks

  
  get 'signup', to: 'users#new'
  resources :users, only: [:index, :show, :new, :create]
end
