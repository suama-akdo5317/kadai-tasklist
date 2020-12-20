Rails.application.routes.draw do
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'

=begin  
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  get 'new/create'
  get 'new/destroy'
=end


  # root to: 'tasks#index'

=begin
  get 'users/index'
  get 'users/show'
  get 'users/new'
  get 'users/create'
=end

  resources :tasks

  resources :users, only: [:index, :show, :new, :create]

end
