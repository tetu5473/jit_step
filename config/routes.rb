Rails.application.routes.draw do
  
  # 認証関連のルート
  devise_for :users

  # ユーザーのダッシュボードページへのルート
  get '/users/dash_boards', to: 'dash_boards#index'
  
  # アプリケーションのルートページ
  root to: 'home#index'

  # ユーザー関連のルート（newとcreateのみ）
  resources :users, only: [:new, :create, :edit, :update]
  # アプリケーションのヘルスチェック用ルート
  get 'up', to: 'rails/health#show', as: :rails_health_check

  # 開発環境のみでLetterOpenerWebを利用
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
