Rails.application.routes.draw do
  resources :articles do
    resources :comments, only: :create
  end
  resources :users
  resources :sessions

  get 'signup', to: 'users#new', as: 'signup'            

  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as:'logout'

  #get 'login' => 'user_session#new'
  #post 'login' => 'user_session#create'
  #delete 'logout' => 'user_sessions#destroy'
  root 'articles#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
