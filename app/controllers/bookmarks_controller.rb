class BookmarksController < ApplicationController
  before_action :set_article

  def create
    bookmark = @article.bookmarks.new(user_id: current_user.id)

    if bookmark.save
      flash[:notice] = 'ブックマークに登録しました'
    else
      flash[:notice] = 'ブックマークの登録に失敗しました'
    end
    
    redirect_back(fallback_location: root_path)
  end

  def destroy
    bookmark = @article.bookmarks.find_by(user_id: current_user.id)
    
    if bookmark.user_id == current_user.id
      bookmark.destroy
      flash[:notice] = 'ブックマークを解除しました'
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def set_article
    @article = Article.find(params[:article_id])
  end
end
