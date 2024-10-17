Rails.application.routes.draw do
  
  devise_for :admin, skip: [:registrations, :password], controllers: {
    sessions: 'admin/sessions'
  }
  
  namespace :admin do
    get 'dashboards', to: 'dashboards#index'
    resources :users, only: [:show, :edit, :update, :destroy]
    get 'game_dashboards', to: 'game_dashboards#index'
    resources :games, only: [:destroy]
    get 'detail_dashboards', to: 'detail_dashboards#index'
    resources :details, only: [:destroy]
    get 'comment_dashboards', to: 'comment_dashboards#index'
    resources :comments, only: [:destroy]
  end
  
  
  scope module: :public do
    devise_for :users
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    root to: "homes#top"
    resources :users, only: [:show, :edit,:update, :destroy] do
      resources :bookmarks, only: [:index]
      resource :relationships, only: [:create, :destroy]
        get 'followings' => 'relationships#followings', as: 'followings'
        get 'followers' => 'relationships#followers', as: 'followers'  
    end
  
    #ネスト
    resources :games do
      resources :details, only: [:new, :create, :show, :edit, :update, :destroy]
      resources :game_comments, only: [:create, :destroy, :index]
      resource :bookmark, only: [:create, :destroy]
    end
    
    resources :game_comment do
      resource :favorite, only: [:create, :destroy]
    end
    
    get "search" => "searches#search"
    
    
    
  end
  
  
end
