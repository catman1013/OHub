class StampsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    stamp = @article.stamps.new(type: params[:type], user_id: current_user.id)

    if stamp.save
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @article = Article.find(params[:article_id])
    stamp = @article.stamps.find_by(type: params[:type], user_id: current_user.id)

    if stamp.destroy
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
  end
end
