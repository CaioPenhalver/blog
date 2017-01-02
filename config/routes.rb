Rails.application.routes.draw do
  resources :articles do
    resources :comments, only: :create
  end

  #get 'login' => 'user_session#new'
  #post 'login' => 'user_session#create'
  #delete 'logout' => 'user_sessions#destroy'
  root 'posts#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
