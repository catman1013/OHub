class BookmarksController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    bookmark = @article.bookmarks.new(user_id: current_user.id)
    if bookmark.save
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @article = Article.find(params[:article_id])
    bookmark = @article.bookmarks.find_by(user_id: current_user.id)
    
    if bookmark.destroy
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
  end
end
