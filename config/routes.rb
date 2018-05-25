Rails.application.routes.draw do
  root to: 'tasks#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'login', to: 'sessions#destroy'
  
  # ７つの基本ルーティングをこれで省略してる
  resources :tasks
  
  # ユーザ登録用のルーティング。edit,update,destroyを除く
  get 'signup', to: 'users#new'
  resources :users, only: [:index, :show, :new, :create ]
end