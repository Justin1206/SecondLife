Rails.application.routes.draw do  
  devise_for :users
  root to: 'items#index'

  # 商品
  resources :items do
    put :favorite, on: :member
  end


  
  # 使用者
  resources :users do
    collection do
      post :usertosale
      get :userfavorite
      get :useritem
    end
  end



  # 訂單
  resources :orders do
    collection do
      post :addtoorder
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
      resources :items do
        member do        
          post  :publish
          post  :hide
        end
      end
      resources :users do
        member do
          post :nottosale
          post :nottoadmin
          post :tosale
          post :toadmin
        end
      end
  end
  

  mount ActionCable.server => '/cable'  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
