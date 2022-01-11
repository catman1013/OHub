class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :prevent_direct_type_by_others, only: [:edit, :update, :destroy]
  
  def index
    @articles = Article.all.where(status: 'published').page(params[:page]).per(10)
  end

  def show
    @comment = Comment.new
    @comments = @article.comments.includes(:user)
    @stamps_count = @article.the_number_of_each_type_of_stamp
  end

  def new
    @article = Article.new
  end

  def create
    article = Article.new(article_params.merge(user_id: current_user.id))

    if article.save
      redirect_to user_mypages_path(current_user), notice: "記事を投稿したうほ"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @article.update(article_params)
      redirect_to user_mypages_path(current_user), notice: "記事を投稿したうほ"
    else
      render :edit
    end
  end

  def destroy
    if @article.user_id = current_user.id
      @article.destroy
      redirect_to user_mypages_path(current_user), notice: '記事を削除しました'
    end
  end

  def narrow_down_by_category
    @articles = Article.all.where(status: 'published', category: params[:category]).page(params[:page]).per(5)
    render :index
  end

  def narrow_down_by_techcategory
    @articles = Article.all.where(status: 'published', tech_category: params[:tech_category]).page(params[:page]).per(5)
    render :index
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def prevent_direct_type_by_others
    unless current_user.id == @article.user.id
      redirect_to root_path, notice: 'はじいたうほ'
    end
  end

  def article_params
    params.require(:article).permit(:title, :content, :category, :tech_category, :status)
  end

end
