# app/controllers/users/articles_controller.rb

module Users
  class ArticlesController < ApplicationController
    before_action :set_article, only: [:show, :edit, :update, :destroy, :remove_image]

    def index
      @articles = Article.all
    end

    def show
    end

    def new
      @article = Article.new
    end

    def create
      @article = Article.new(article_params)
      if @article.save
        redirect_to [:users, @article], notice: 'Article was successfully created.'
      else
        render :new
      end
    end

    def edit
    end

    def update
      if @article.update(article_params)
        redirect_to [:users, @article], notice: 'Article was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @article.destroy
      redirect_to users_articles_url, notice: 'Article was successfully destroyed.'
    end

    def remove_image
      @article.image.purge
      redirect_to edit_users_article_path(@article), notice: '画像が削除されました。'
    end

    private

    def set_article
      @article = Article.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:title, :content, :image)
    end
  end
end
