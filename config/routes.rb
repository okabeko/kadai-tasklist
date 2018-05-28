Rails.application.routes.draw do
  get 'toppages/index'

  # トップページを用意する
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'login', to: 'sessions#destroy'
  
  # ７つの基本ルーティングをこれで省略してる
  resources :tasks
  
  # ユーザ登録用のルーティング。edit,update,destroyを除く
  get 'signup', to: 'users#new'
  resources :users, only: [ :new, :create ]
  
end