class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params.merge(user_id: current_user.id))

    if @article.save
      redirect_to articles_path, notice: "記事を投稿したうほ"
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
      redirect_to articles_url, notice: "記事を更新したっほ"
    else
      render :edit
    end
  end

  def destroy
    article = Article.find(params[:id])
    
    if article.user_id = current_user.id
      article.destroy
      redirect_to articles_path, notice: "記事を削除したっほ"
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :content, :category)
  end

end
