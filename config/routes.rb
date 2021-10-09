Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get '/home/about' =>'homes#about',as: 'about'
  get '/home/search' =>'homes#search',as: 'search_item'
  get 'search' => 'posts#search'

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

  resources :contacts, only: [:new, :create]
  post 'contacts/confirm', to: 'contacts#confirm', as: 'confirm'
  post 'contacts/back', to: 'contacts#back', as: 'back'
  get 'done', to: 'contacts#done', as: 'done'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
