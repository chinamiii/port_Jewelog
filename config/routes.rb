Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get '/home/about' =>'homes#about',as: 'about'
  get '/home/item' =>'homes#item',as: 'item'

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
