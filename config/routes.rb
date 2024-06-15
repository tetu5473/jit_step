Rails.application.routes.draw do
  namespace :users do
    get 'articles/index'
    get 'articles/show'
    get 'articles/new'
    get 'articles/edit'
  end
  # 認証関連のルート
  devise_for :users

  # ユーザーのダッシュボードページへのルート
  get '/users/dash_boards', to: 'dash_boards#index'
  
  # アプリケーションのルートページをログイン画面に設定
  devise_scope :user do
    authenticated :user do
      root 'dash_boards#index', as: :authenticated_root
    end
    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  # ユーザー関連のルート（newとcreateのみ）
  resources :users, only: [:new, :create, :edit, :update]

  # アプリケーションのヘルスチェック用ルート
  get 'up', to: 'rails/health#show', as: :rails_health_check

  # 開発環境のみでLetterOpenerWebを利用
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
