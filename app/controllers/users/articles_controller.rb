# app/controllers/users/articles_controller.rb

module Users
  class ArticlesController < ApplicationController
    before_action :set_article, only: [:show, :edit, :update, :destroy]

    # 一覧画面
    def index
      @articles = Article.all
    end

    # 詳細画面
    def show
    end

    # 新規作成画面
    def new
      @article = Article.new
    end

    # 新規作成処理
    def create
      @article = Article.new(article_params)
      if @article.save
        redirect_to [:users, @article], notice: 'Article was successfully created.'
      else
        render :new
      end
    end

    # 編集画面
    def edit
    end

    # 更新処理
    def update
      if @article.update(article_params)
        redirect_to [:users, @article], notice: 'Article was successfully updated.'
      else
        render :edit
      end
    end

    # 削除処理
    def destroy
      @article.destroy
      redirect_to users_articles_url, notice: 'Article was successfully destroyed.'
    end

    private

    # 共通処理: 記事の設定
    def set_article
      @article = Article.find(params[:id])
    end

    # 記事のパラメータの許可
    def article_params
      params.require(:article).permit(:title, :body)
    end
  end
end
