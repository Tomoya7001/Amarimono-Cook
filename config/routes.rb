Rails.application.routes.draw do
  namespace :public do
    get 'homes/top'
  end
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

  namespace :admin do
    root to: 'homes#top'
    resources :customers, only: [:index, :show, :edit, :update]
    resources :cooks, only: [:create, :new, :index, :show, :edit, :update, :destroy]
    resources :genres, only: [:create, :index, :edit, :update]
  end

  root to: 'public/homes#top'
  namespace :public do
    root to: 'homes#top'
    get '/customers/my_page' => 'customers#show', as: 'my_page'

    resources :cooks, only: [:index, :show, :new, :create] do
      resources :likes, only: [:create, :destroy]
      resources :comments, only: [:create, :destroy]
    end
    resources :genres, only: [:index, :show]
    resources :bookmarks, only: [:index]
  end
end
