Rails.application.routes.draw do

  scope module: :public do
    root to: "homes#top"
    get "about" => "homes#about"
    resources :items, only: [:index, :show]
    resource :customers, only: [:edit, :update] do
      get "mypage" => "customers#show"
      get "unsubscribe" => "customers#unsubscribe"
      patch "quit" => "customers#quit"
    end

    resources :cart_items, only: [:index, :update, :destroy, :create] do
      collection do
        delete "destroy_all" => "cart_items#destroy_all"
      end
    end

    resources :orders, only: [:index, :new, :create, :show] do
      collection do
        post "confirm" => "orders#confirm"
        get "confirm" => "orders#new"
        get "thanks" => "orders#thanks"
      end
    end

    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
  end

  namespace :admin do
    root to: "homes#top"
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :genres, only: [:index, :create, :show, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show, :update] do
      resources :order_details, only: [:update]
    end
  end

  # 管理者用
  # URL /admin/sign_in
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  # 顧客用
  # URL /customres/sign_in
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }




  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
