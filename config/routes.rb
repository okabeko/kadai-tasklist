Rails.application.routes.draw do
  root to: 'tasks#index'
  
  # ７つの基本ルーティングをこれで省略してる
  resources :tasks
end