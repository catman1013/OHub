class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
    @comment = Comment.new
    @comments = @article.comments.includes(:user)
    @stamps_count = @article.count_the_number_of_each_type_of_stamps
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params.merge(user_id: current_user.id))

    if @article.save
      redirect_to user_mypages_path(current_user), notice: "記事を投稿したうほ"
    else
      render :new
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to user_mypages_path(current_user), notice: "記事を投稿したうほ"
    else
      render :edit
    end
  end

  def destroy
    article = Article.find(params[:id])
    
    if article.user_id = current_user.id
      article.destroy
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :content, :category, :status)
  end

end
