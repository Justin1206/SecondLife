Rails.application.routes.draw do  

  mount ActionCable.server => '/cable'  

  devise_for :users
  root to: 'items#index'

  resources :items do
    put :favorite, on: :member
  end
  

  resources :users do
    collection do
      post :usertosale
    end
  end

  resources :conversations do
    member do
      post :close
    end

    resources :messages, only: [:create]
  end
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
