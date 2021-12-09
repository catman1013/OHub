class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params.merge(user_id: current_user.id,article_id: params[:article_id]))

    if @comment.save
      redirect_to article_path(@comment.article.id), notice: "コメントを投稿したうっほ！"
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def edit
  end

  def destroy
    comment = Comment.find(params[:id])
    
    if comment.user_id = current_user.id
      comment.destroy!
      redirect_back(fallback_location: root_path)
    end
  end
  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
