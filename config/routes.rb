Rails.application.routes.draw do
  
  devise_for :admin, skip: [:registrations, :password], controllers: {
    sessions: 'admin/sessions'
  }
  root to: "homes#top"
  
  namespace :admin do
    get 'dashboards', to: 'dashboards#index'
    resources :users, only: [:destroy]
    get 'game_dashboards', to: 'game_dashboards#index'
    resources :games, only: [:destroy]
  end
  
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "homes#top"
  resources :users, only: [:show, :edit,:update, :destroy]
  
  #ネスト
  resources :games do
    resources :details, only: [:new, :create, :show, :edit, :update, :destroy]
    resources :game_comments, only: [:create, :destroy, :index]
  end
  
  get "search" => "searches#search"
  
end
