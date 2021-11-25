Rails.application.routes.draw do

  devise_for :users
  root to: 'homes#top'
  get '/home/about' => 'homes#about', as: 'about'
  get '/home/search' => 'homes#search', as: 'search_item'
  get '/home/material' => 'homes#material', as: 'material'

  get 'search' => 'posts#search'


  resources :inquiry, only: [:inquiries, :confirm, :thanks] do
    collection do
      get 'inquiries' # 入力画面
      post 'confirm' # 確認画面
      post 'thanks' # 送信完了画面
    end
  end

  resources :posts do
    resources :post_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
    resources :items, only: [:index]
  end
  resources :users do
    collection do
      get :favorites
    end
    resources :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
