class CommentsController < ApplicationController
  before_action :set_article, only: :create

  def create
    comment = @article.comments.new(comment_params.merge(user_id: current_user.id))
    
    if comment.save
      flash[:notice] = 'コメントを投稿したうほっほ'
    else
      flash[:notice] = 'コメントの投稿に失敗しました'
    end
    
    redirect_back(fallback_location: root_path)
  end

  def destroy
    comment = Comment.find(params[:id])
    
    if comment.user_id = current_user.id
      comment.destroy
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def set_article
    @article = Article.find(params[:article_id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
