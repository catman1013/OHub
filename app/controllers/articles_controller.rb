class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :prevent_direct_type_by_others, only: [:edit, :update, :destroy]
  
  def index
    articles = Article.where(status: 'published')
    articles = articles.where(category: params[:category]) if params[:category]
    articles = articles.where(tech_category: params[:tech_category])if params[:tech_category]
    @articles = articles.page(params[:page]).per(12)
    @category = params[:category] if params[:category]
    @tech_category = params[:tech_category] if params[:tech_category]
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
      redirect_to user_path(current_user), notice: "記事を投稿したうほ"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @article.update(article_params)
      redirect_to user_path(current_user), notice: "記事を更新したうほ"
    else
      render :edit
    end
  end

  def destroy
    if @article.user_id = current_user.id
      @article.destroy
      redirect_to user_path(current_user), notice: '記事を削除しました'
    end
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
