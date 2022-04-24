Rails.application.routes.draw do


  # 顧客用
  # URL /customers/sign_in ...
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  root to: 'public/homes#top'
  #get '/search', to: 'public/cooks#search'
  # ゲストログイン用
  devise_scope :customer do
    post 'customers/guest_sign_in', to: 'customers/sessions#new_guest'
  end

  namespace :admin do
    root to: 'homes#top'
    resources :customers, only: [:index, :show, :edit, :update]
    resources :cooks, only: [:create, :new, :index, :show, :edit, :update, :destroy]
    resources :reviews, only: [:index, :create, :show, :destroy]
    resources :genres, only: [:create, :index, :edit, :update]
  end

  namespace :public do
    root to: 'homes#top'
    get '/customers/my_page' => 'customers#mypage', as: 'my_page'
    get '/customers/:id' => 'customers#show'
    get '/public/home/about' => 'homes#about', as: 'about'
    get '/customers/:id/unsubscribe' => 'customers#unsubscribe', as: 'unsubscribe'
    patch 'customers/:id/withdraw' => 'customers#withdraw', as: 'withdraw'

    resources :cooks, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
      #検索機能
      collection do
        get 'search'
      end
      resources :comments, only: [:create, :destroy]
      resource :favorites, only: [:create, :destroy]
      resources :reviews, only: [:index, :create, :show]
    end
    resources :genres, only: [:index, :show]
    resources :bookmarks, only: [:index]
    # メモ用


    resources :customers, only: [:edit, :index, :update] do
      resources :memos, only: [:index, :create, :update, :destroy] do
      collection do
        delete 'destroy_all'
      end
    end
      resource :relationships, only: [:create, :destroy]
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
    end
  end

  devise_scope :customer do
    get '/customers/sign_out' => 'devise/sessions#destroy'
  end

  devise_scope :admin do
    get '/admin/sign_out' => 'devise/sessions#destroy'
  end

end