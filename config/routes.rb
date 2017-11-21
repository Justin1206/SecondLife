Rails.application.routes.draw do  
  resources :orders
  devise_for :users
  root to: 'items#index'

  # 商品
  resources :items do
    put :favorite, on: :member
  end

  # 訂單
  
  # 使用者
  resources :users do
    collection do
      post :usertosale
    end
  end

   # 聊天
  resources :conversations do
    member do
      post :close
    end
    resources :messages, only: [:create]
  end

  # 後台管理
  namespace :admin do
    resources :items
    resources :users
  end
  

  mount ActionCable.server => '/cable'  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
