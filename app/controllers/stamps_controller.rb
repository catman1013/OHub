class StampsController < ApplicationController
  before_action :set_article_with_article_id

  def create
    stamp = @article.stamps.new(stamp_params.merge(user_id: current_user.id))

    if stamp.save
      flash[:notice] = "#{stamp[:type]}スタンプを押したっぴ"
    else
      flash[:notice] = 'スタンプ押しに失敗したうほ'
    end

    redirect_back(fallback_location: root_path)
  end

  def destroy
    stamp = @article.stamps.find_by(type: params[:type], user_id: current_user.id)

    if stamp.user_id == current_user.id
      stamp.destroy
      flash[:notice] = "#{stamp[:type]}スタンプを取り消しました"
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def set_article_with_article_id
    @article = Article.find(params[:article_id])
  end
  
  def stamp_params
    params.permit(:type)
  end
end
